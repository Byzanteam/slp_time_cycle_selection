class CreateSlpTimeCycleSelectionPeriodicModuleDates < ActiveRecord::Migration[5.2]
  def change
    create_table :slp_time_cycle_selection_periodic_module_dates do |t|
      t.integer :name
      t.string :type
      t.belongs_to :project, index: { name: 'periodic_module_dates_on_project_id' }

      t.timestamps
    end
  end
end
