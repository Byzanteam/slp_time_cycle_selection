class CreateSlpTimeCycleSelectionProfileDates < ActiveRecord::Migration[5.2]
  def change
    create_table :slp_time_cycle_selection_profile_dates do |t|
      t.belongs_to :project, index: true
      t.string :workdays, array: true, default: []
      t.string :holidays, array: true, default: []

      t.timestamps
    end
  end
end
