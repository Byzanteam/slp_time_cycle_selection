module SlpTimeCycleSelection
  class Project < ApplicationRecord
    before_create :set_default_periodic_module

    has_many :periodic_modules, :class_name => 'SlpTimeCycleSelection::PeriodicModule'

    enum delay_minute_unit: {
      'minute' => 0,
      'hour' => 1,
      'day' => 2
    }

    private

    def set_default_periodic_module
      periodic_modules.create(name: '默认')
    end
  end
end
