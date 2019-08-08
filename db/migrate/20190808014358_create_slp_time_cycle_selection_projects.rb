class CreateSlpTimeCycleSelectionProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :slp_time_cycle_selection_projects do |t|
      t.string :name
      t.integer :delay_minutes
      t.integer :delay_minute_unit

      t.timestamps
    end
  end
end
