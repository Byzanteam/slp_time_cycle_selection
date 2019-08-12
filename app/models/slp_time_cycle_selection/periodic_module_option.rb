module SlpTimeCycleSelection
  class PeriodicModuleOption < ApplicationRecord
    belongs_to :periodic_module, class_name: 'SlpTimeCycleSelection::PeriodicModule'

    def save(*args, &block)
      if start_at.present?
        option.clear
        option << start_at.strftime('%T')
      end

      option << end_at.strftime('T') if end_at.present?

      super(*args, &block)
    end
  end
end
