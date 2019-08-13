module SlpTimeCycleSelection
  class PeriodicRule < ApplicationRecord
    belongs_to :project, class_name: 'SlpTimeCycleSelection::Project', foreign_key: 'project_id'
    has_one :profile_date, :class_name => 'SlpTimeCycleSelection::ProfileDate', foreign_key: 'rule_id'

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
