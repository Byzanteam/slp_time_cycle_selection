module SlpTimeCycleSelection
  class PeriodicModule < ApplicationRecord
    belongs_to :project, :class_name => 'SlpTimeCycleSelection::Project'
    has_many :periodic_module_days, :class_name => 'SlpTimeCycleSelection::PeriodicModuleDay', dependent: :destroy
  end
end
