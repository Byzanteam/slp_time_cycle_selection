json.(module_date, :id, :name, :type, :project_id)

json.periodic_modules do
  json.partial! partial: 'slp_time_cycle_selection/periodic_modules/periodic_module', collection: module_date.periodic_modules, as: :periodic_module
end
