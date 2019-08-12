json.(periodic_module, :id, :name)

json.periodic_module_dates do
  json.partial! partial: 'slp_time_cycle_selection/periodic_module_dates/periodic_module_date', collection: periodic_module.module_dates, as: :module_date
end
