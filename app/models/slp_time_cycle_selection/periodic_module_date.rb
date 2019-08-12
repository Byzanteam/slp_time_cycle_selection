module SlpTimeCycleSelection
  class PeriodicModuleDate < ApplicationRecord
    validates :name, presence: true

    belongs_to :periodic_module, class_name: 'SlpTimeCycleSelection::PeriodicModule'
    has_many :options, class_name: 'SlpTimeCycleSelection::PeriodicModuleOption', dependent: :destroy

    after_create :set_default_options

    accepts_nested_attributes_for :options, allow_destroy: true

    enum name: {
      'Monday' => 0,
      'Tuesday' => 1,
      'Wednesday' => 2,
      'Thursday' => 3,
      'Friday' => 4,
      'Saturday' => 5,
      'Sunday' => 6,
    }

    DATES = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].freeze

    scope :monday, -> { find_by(type: 'SlpTimeCycleSelection::PeriodicModuleDate::Monday') }
    scope :tuesday, -> { find_by(type: 'SlpTimeCycleSelection::PeriodicModuleDate::Tuesday') }
    scope :wednesday, -> { find_by(type: 'SlpTimeCycleSelection::PeriodicModuleDate::Wednesday') }
    scope :thursday, -> { find_by(type: 'SlpTimeCycleSelection::PeriodicModuleDate::Thursday') }
    scope :friday, -> { find_by(type: 'SlpTimeCycleSelection::PeriodicModuleDate::Friday') }
    scope :saturday, -> { find_by(type: 'SlpTimeCycleSelection::PeriodicModuleDate::Saturday') }
    scope :sunday, -> { find_by(type: 'SlpTimeCycleSelection::PeriodicModuleDate::Sunday') }

    private

    def set_default_options
      options.create(option: %w[00:00 23:59])
    end
  end
end
