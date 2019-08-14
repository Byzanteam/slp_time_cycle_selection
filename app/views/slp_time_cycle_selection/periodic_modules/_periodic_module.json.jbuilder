json.(periodic_module, :id, :name)

json.module_options do
  json.partial! partial: 'slp_time_cycle_selection/periodic_module_options/periodic_module_option', collection: periodic_module.options, as: :option
end
