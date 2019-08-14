module SlpTimeCycleSelection
  class PeriodicRule < ApplicationRecord
    belongs_to :project, class_name: 'SlpTimeCycleSelection::Project', foreign_key: 'project_id'

    validate :validate_cycle_dates, if: proc { type == 'SlpTimeCycleSelection::PeriodicRule::Custom' }

    def save(*args, &block)
      case self
      when SlpTimeCycleSelection::PeriodicRule::Custom
        set_cycle_type
        super(*args, &block)
      else
        super(*args, &block)
      end
    end

    def start_date
      start_time = Time.now + project.delay_minutes.minutes
      Date.parse(start_time.to_s)
    end

    def profile_date
      project.profile_date
    end

    def default_periodic_dates
      periodic_dates = []
      project.range_dates.times.each do |i|
        periodic_dates << (start_date + i.days)
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

    def is_workday?(date)
      ChineseHolidays.is_workday?(date)
    end

    def filter_holidays
      profile_date.holidays.select do |date|
        date >= start_date
      end
    end

    def filter_workdays
      profile_date.workdays.select do |date|
        date >= start_date
      end
    end

    private

    def set_cycle_type
      cycle_date.uniq!
      cycle_date_size = cycle_date.size

      if cycle_date_size == 2
        saturday_to_sunday = %w[Saturday Sunday]

        unless (cycle_date - saturday_to_sunday).present?
          self.type = 'SlpTimeCycleSelection::PeriodicRule::SaturdayToSunday'
          cycle_date.clear
        end
      elsif cycle_date_size == 5
        monday_to_friday = %w[Monday Tuesday Wednesday Thursday Friday]

        unless (cycle_date - monday_to_friday).present?
          self.type = 'SlpTimeCycleSelection::PeriodicRule::MondayToFriday'
          cycle_date.clear
        end
      end
    end

    def validate_cycle_dates
      default_cycle_date = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]

      if (Array(cycle_date) - default_cycle_date).present?
        errors.add(:base, '周期只能为周一到周日')
      end
    end
  end
end
