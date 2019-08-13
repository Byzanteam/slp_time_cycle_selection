module SlpTimeCycleSelection
  class ProfileDate < ApplicationRecord
    belongs_to :project, :class_name => 'SlpTimeCycleSelection::Project'
  end
end
