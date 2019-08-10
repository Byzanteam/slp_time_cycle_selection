class CreateSlpTimeCycleSelectionPeriodicModuleOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :slp_time_cycle_selection_periodic_module_options do |t|
      t.belongs_to :periodic_module_date, index: { name: :periodic_module_options_on_periodic_module_date_id }
      t.datetime :start_at
      t.datetime :end_at
      t.integer :upper_limit
      t.string :option, array: true, default: []

      t.timestamps
    end
  end
end
