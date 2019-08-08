module SlpTimeCycleSelection
  class PeriodicModuleDay < ApplicationRecord
    validates :name, presence: true

    belongs_to :periodic_module, :class_name => 'SlpTimeCycleSelection::PeriodicModule'

    enum name: {
      'Monday' => 0,
      'Tuesday' => 1,
      'Wednesday' => 2,
      'Thursday' => 3,
      'Friday' => 4,
      'Saturday' => 5,
      'Sunday' => 6
    }
  end
end
