module SlpTimeCycleSelection
  class PeriodicModuleOption < ApplicationRecord
    belongs_to :module_date, class_name: 'SlpTimeCycleSelection::PeriodicModuleDate', foreign_key: 'periodic_module_date_id'
    delegate :periodic_module, to: :module_date

    after_commit :set_option, only: [:create, :update]

    private

    def set_option
      return unless start_at

      option.clear
      option << start_at.strftime('%H:%S')
      option << end_at.strftime('%H:%S') if start_at.present? && end_at.present?
    end
  end
end
