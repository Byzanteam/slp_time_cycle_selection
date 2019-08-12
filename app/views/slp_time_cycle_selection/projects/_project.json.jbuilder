json.(project, :id, :name, :delay_minutes, :delay_minute_unit)

unless params[:index] == 'index'
  json.periodic_modules do
    json.partial! partial: 'slp_time_cycle_selection/periodic_modules/periodic_module', collection: project.periodic_modules, as: :periodic_module
  end
  json.rule do
    json.partial! partial: 'slp_time_cycle_selection/periodic_rules/periodic_rule', object: project.rule, as: :periodic_rule
  end
end
