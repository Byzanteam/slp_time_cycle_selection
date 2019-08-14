module SlpTimeCycleSelection
  class PeriodicRule
    class Custom < PeriodicRule
      def calculate_periodic_dates
        return if project.range_dates.zero?
        @periodic_dates = default_periodic_dates
        generator_dates_result
      end

      private

      def generator_dates_result
        delete_dates = filter_periodic_dates | delete_not_custom_dates

        unless delete_dates.empty?
          push_dates(delete_dates.size)
          @periodic_dates -= delete_dates
          generator_dates_result
        end

        @periodic_dates
      end

      def delete_not_custom_dates
        not_custom_dates = []
        @periodic_dates.each do |periodic_date|
          if filter_workdays.include?(periodic_date)
            nil
          else
            week_date = PeriodicModuleDate::DATES[periodic_date.wday]
            unless profile_date.cycle_date.include(week_date)
              not_custom_dates << periodic_date
            end
          end
        end
        not_custom_dates
      end
    end
  end
end
