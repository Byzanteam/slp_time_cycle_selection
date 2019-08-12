json.(module_date, :id, :name, :type, :periodic_module_id)

json.options do
  json.partial! partial: 'slp_time_cycle_selection/periodic_module_options/periodic_module_option', collection: module_date.options, as: :option
end
