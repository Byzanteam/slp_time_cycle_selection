module SlpTimeCycleSelection
  class PeriodicModuleOption < ApplicationRecord
    belongs_to :module_date, class_name: 'SlpTimeCycleSelection::PeriodicModuleDate', foreign_key: 'periodic_module_date_id'
    delegate :periodic_module, to: :module_date

    before_commit :set_option, only: [:create, :update]

    private

    def set_option
      return unless created_at

      option.clear
      option << created_at.strftime('%H:%S')
      option << end_at.strftime('%H:%S')
    end
  end
end
