class CreateSlpTimeCycleSelectionPeriodicRules < ActiveRecord::Migration[5.2]
  def change
    create_table :slp_time_cycle_selection_periodic_rules do |t|
      t.string :type
      t.string :cycle_date, array: true, default: []
      t.belongs_to :project, index: true

      t.timestamps
    end
  end
end
