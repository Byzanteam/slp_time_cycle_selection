module SlpTimeCycleSelection
  class PeriodicRule
    class MondayToFriday < PeriodicRule
      def calculate_periodic_dates
        return if project.range_dates.zero?
        @periodic_dates = default_periodic_dates
        generator_dates_result
      end

      private

      def generator_dates_result
        delete_dates = filter_periodic_dates | delete_monday_to_friday

        unless delete_dates.empty?
          push_dates(delete_dates.size)
          @periodic_dates -= delete_dates
          generator_dates_result
        end

        @periodic_dates
      end

      def delete_monday_to_friday
        monday_to_friday = []
        @periodic_dates.each do |periodic_date|
          if filter_workdays.include?(periodic_date)
            nil
          else
            if periodic_date.saturday? || periodic_date.sunday?
              monday_to_friday << periodic_date
            end
          end
        end
        monday_to_friday
      end
    end
  end
end
