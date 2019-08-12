class CreateSlpTimeCycleSelectionPeriodicModules < ActiveRecord::Migration[5.2]
  def change
    create_table :slp_time_cycle_selection_periodic_modules do |t|
      t.string :name
      t.belongs_to :periodic_module_date, index: { name: 'periodic_modules_on_periodic_module_date_id' }

      t.timestamps
    end
  end
end
