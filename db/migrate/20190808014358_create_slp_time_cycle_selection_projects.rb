class CreateSlpTimeCycleSelectionProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :slp_time_cycle_selection_projects do |t|
      t.string :name
      t.integer :delay_minutes, default: 0
      t.integer :delay_minute_unit, default: 0
      t.integer :range_dates, default: 0
      t.integer :range_date_unit, default: 0

      t.timestamps
    end
  end
end
