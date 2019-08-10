module SlpTimeCycleSelection
  class PeriodicModuleOption < ApplicationRecord
    belongs_to :module_date, class_name: 'SlpTimeCycleSelection::PeriodicModuleDate', foreign_key: 'periodic_module_date_id'
    delegate :periodic_module, to: :module_date
  end
end
