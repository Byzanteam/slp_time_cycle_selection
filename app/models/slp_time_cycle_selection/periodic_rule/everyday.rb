module SlpTimeCycleSelection
  class PeriodicRule
    class Everyday < PeriodicRule
      def calculate_periodic_dates
        return if project.range_dates.zero?
        @periodic_dates = default_periodic_dates
        generator_dates_result
      end

      private

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
