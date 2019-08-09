module SlpTimeCycleSelection
  class PeriodicModule < ApplicationRecord
    belongs_to :project, :class_name => 'SlpTimeCycleSelection::Project'
    has_many :periodic_module_dates, :class_name => 'SlpTimeCycleSelection::PeriodicModuleDate', dependent: :destroy

    after_create :set_default_periodic_module_dates

    private

    def set_default_periodic_module_dates
      ActiveRecord::Base.transaction do
        (0..6).each do |day|
          periodic_module_dates.create(name: day)
        end
      end
    end
  end
end
