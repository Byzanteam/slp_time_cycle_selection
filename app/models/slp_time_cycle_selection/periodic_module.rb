module SlpTimeCycleSelection
  class PeriodicModule < ApplicationRecord
    belongs_to :module_date, :class_name => 'SlpTimeCycleSelection::PeriodicModuleDate', foreign_key: 'periodic_module_date_id'
    has_many :options, :class_name => 'SlpTimeCycleSelection::PeriodicModuleOption', dependent: :destroy

    accepts_nested_attributes_for :options, allow_destroy: true

    after_create :set_default_options

    private

    def set_default_options
      options.create(option: %w[00:00 23:59])
    end
  end
end
