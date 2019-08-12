module SlpTimeCycleSelection
  class PeriodicRule < ApplicationRecord
    belongs_to :project, class_name: 'SlpTimeCycleSelection::Project', foreign_key: 'project_id'
  end
end
