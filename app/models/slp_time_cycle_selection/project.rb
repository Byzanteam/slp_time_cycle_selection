module SlpTimeCycleSelection
  class Project < ApplicationRecord
    validates :delay_minutes, presence: true
    validates :delay_minute_unit, presence: true

    enum delay_minute_unit: {
      'minute' => '1',
      'hour' => '2',
      'day' => '3'
    }
  end
end
