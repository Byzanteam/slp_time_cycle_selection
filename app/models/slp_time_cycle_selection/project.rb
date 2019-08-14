module SlpTimeCycleSelection
  class Project < ApplicationRecord
    after_create :set_default_periodic_module_dates
    after_create :set_default_rule
    after_create :set_profile_date

    has_many :module_dates, class_name: 'SlpTimeCycleSelection::PeriodicModuleDate'
    has_one :rule, class_name: 'SlpTimeCycleSelection::PeriodicRule', dependent: :destroy
    has_one :profile_date, :class_name => 'SlpTimeCycleSelection::ProfileDate'

    accepts_nested_attributes_for :module_dates, allow_destroy: false, update_only: false
    accepts_nested_attributes_for :rule, allow_destroy: false, update_only: true

    enum delay_minute_unit: {
      'minute' => 0,
      'hour' => 1,
      'day' => 2
    }

    enum range_date_unit: {
      'range_day' => 0
    }

    private

    def set_default_periodic_module_dates
      SlpTimeCycleSelection::PeriodicModuleDate::DATES.each do |date|
        module_date = "SlpTimeCycleSelection::PeriodicModuleDate::#{date}".constantize.new
        module_date.name = date
        module_date.project_id = id
        module_date.save
      end
    end

    def set_default_rule
      create_rule(type: 'SlpTimeCycleSelection::PeriodicRule::Everyday')
    end

    def set_profile_date
      create_profile_date
    end
  end
end
