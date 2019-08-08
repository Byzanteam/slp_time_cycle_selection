module SlpTimeCycleSelection
  class Project < ApplicationRecord
    enum delay_minute_unit: {
      'minute' => 0,
      'hour' => 1,
      'day' => 2
    }
  end
end
