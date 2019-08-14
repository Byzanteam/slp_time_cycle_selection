module SlpTimeCycleSelection
  class PeriodicRule
    class Workday < PeriodicRule
      def calculate_periodic_dates
        return if project.range_dates.zero?
        @periodic_dates = default_periodic_dates
        generator_dates_result
      end

      private

      def generator_dates_result
        delete_dates = filter_periodic_dates | delete_weekend

        unless delete_dates.empty?
          push_dates(delete_dates.size)
          @periodic_dates -= delete_dates
          generator_dates_result
        end

        @periodic_dates
      end

      def delete_weekend
        holidays = []
        @periodic_dates.each do |periodic_date|
          if filter_workdays.include?(periodic_date)
            nil
          else
            unless is_workday?(periodic_date)
              holidays << periodic_date
            end
          end
        end
        holidays
      end
    end
  end
end
