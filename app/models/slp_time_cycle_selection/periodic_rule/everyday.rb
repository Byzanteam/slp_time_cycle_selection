module SlpTimeCycleSelection
  class PeriodicRule
    class Everyday < PeriodicRule
      def calculate_periodic_dates
        return if project.range_dates.zero?
        @periodic_dates = default_periodic_dates
        generator_dates_result
      end

      private

      def filter_holidays
        profile_date.holidays.select do |date|
          date >= Date.parse(start_time.to_s)
        end
      end

      def profile_date
        project.profile_date
      end

      def default_periodic_dates
        periodic_dates = []
        project.range_dates.times.each do |i|
          periodic_dates << (Date.parse(start_time.to_s) + i.days)
        end
        periodic_dates
      end

      def filter_periodic_dates
        @periodic_dates & filter_holidays
      end

      def push_dates(days)
        days.times.each do |_|
          add_day = @periodic_dates.last + 1.days
          @periodic_dates << add_day
        end
      end

      def generator_dates_result
        delete_dates = filter_periodic_dates

        if delete_dates.empty?
          @periodic_dates
        else
          push_dates(delete_dates.size)
          @periodic_dates -= delete_dates
          generator_dates_result
        end
      end
    end
  end
end
