module SlpTimeCycleSelection
  class PeriodicModule < ApplicationRecord
    belongs_to :project, :class_name => 'SlpTimeCycleSelection::Project'
    has_many :periodic_module_days, :class_name => 'SlpTimeCycleSelection::PeriodicModuleDay', dependent: :destroy

    after_create :set_default_periodic_module_days

    private

    def set_default_periodic_module_days
      ActiveRecord::Base.transaction do
        (0..6).each do |day|
          periodic_module_days.create(name: day)
        end
      end
    end
  end
end
