module SlpTimeCycleSelection
  class PeriodicModule < ApplicationRecord
    belongs_to :project, :class_name => 'SlpTimeCycleSelection::Project'
  end
end
