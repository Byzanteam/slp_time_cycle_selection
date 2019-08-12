module SlpTimeCycleSelection
  class Project < ApplicationRecord
    after_create :set_default_periodic_module

    has_many :periodic_modules, class_name: 'SlpTimeCycleSelection::PeriodicModule', dependent: :destroy
    has_one :rule, class_name: 'SlpTimeCycleSelection::PeriodicRule'

    accepts_nested_attributes_for :periodic_modules, allow_destroy: true

    enum delay_minute_unit: {
      'minute' => 0,
      'hour' => 1,
      'day' => 2
    }

    private

    def set_default_periodic_module
      periodic_modules.create(name: '默认') if periodic_modules.empty?
    end
  end
end
