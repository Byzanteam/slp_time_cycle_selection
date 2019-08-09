class CreateSlpTimeCycleSelectionPeriodicModuleDates < ActiveRecord::Migration[5.2]
  def change
    create_table :slp_time_cycle_selection_periodic_module_dates do |t|
      t.integer :name
      t.belongs_to :periodic_module, index: { name: :periodic_module_dates_on_periodic_module_id }
      t.belongs_to :dateable, polymorphic: true, index: { name: :periodic_module_dates_on_dateable_type_and_dateable_id }

      t.timestamps
    end
  end
end
