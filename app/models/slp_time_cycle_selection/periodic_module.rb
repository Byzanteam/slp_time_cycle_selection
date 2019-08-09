module SlpTimeCycleSelection
  class PeriodicModule < ApplicationRecord
    belongs_to :project, :class_name => 'SlpTimeCycleSelection::Project'
    has_many :module_dates, :class_name => 'SlpTimeCycleSelection::PeriodicModuleDate', dependent: :destroy

    after_create :set_default_periodic_module_dates

    accepts_nested_attributes_for :module_dates, allow_destroy: false, update_only: false

    private

    def set_default_periodic_module_dates
      SlpTimeCycleSelection::PeriodicModuleDate::DATES.each do |date|
        module_date = "SlpTimeCycleSelection::PeriodicModuleDate::#{date}".constantize.new
        module_date.name = date
        module_date.periodic_module_id = id
        module_date.save
      end
    end
  end
end
