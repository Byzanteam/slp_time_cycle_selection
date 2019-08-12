module SlpTimeCycleSelection
  class PeriodicModuleOption < ApplicationRecord
    belongs_to :module_date, class_name: 'SlpTimeCycleSelection::PeriodicModuleDate', foreign_key: 'periodic_module_date_id'
    delegate :periodic_module, to: :module_date

    def save(attributes)
      if start_at.present?
        option.clear
        option << start_at.strftime('%T')
      end

      option << end_at.strftime('T') if end_at.present?

      super(attributes)
    end
  end
end
