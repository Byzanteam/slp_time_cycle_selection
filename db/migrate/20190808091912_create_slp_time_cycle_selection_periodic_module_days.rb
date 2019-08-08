class CreateSlpTimeCycleSelectionPeriodicModuleDays < ActiveRecord::Migration[5.2]
  def change
    create_table :slp_time_cycle_selection_periodic_module_days do |t|
      t.integer :name
      t.belongs_to :periodic_module, index: { name: :periodic_module_days_on_periodic_module_id }

      t.timestamps
    end
  end
end
