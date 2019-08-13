module SlpTimeCycleSelection
  class ProfileDate < ApplicationRecord
    belongs_to :rule, :class_name => 'SlpTimeCycleSelection::PeriodicRule'
  end
end
