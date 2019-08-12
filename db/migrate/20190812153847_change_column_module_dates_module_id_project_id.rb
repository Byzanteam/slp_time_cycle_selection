class ChangeColumnModuleDatesModuleIdProjectId < ActiveRecord::Migration[5.2]
  def change
    rename_column :slp_time_cycle_selection_periodic_module_dates, :periodic_module_id, :project_id
  end
end
