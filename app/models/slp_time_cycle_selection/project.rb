module SlpTimeCycleSelection
  class Project < ApplicationRecord
    validates :delay_minutes, presence: true
    validates :delay_minute_unit, presence: true

    enum delay_minute_unit: {
      'minute' => 0,
      'hour' => 1,
      'day' => 2
    }
  end
end
