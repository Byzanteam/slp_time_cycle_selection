json.(project, :id, :name, :delay_minutes, :delay_minute_unit)

unless params[:index] == 'index'
  json.module_dates do
    json.partial! partial: 'slp_time_cycle_selection/periodic_module_dates/periodic_module_date', collection: project.module_dates, as: :module_date
  end
  json.rule do
    json.partial! partial: 'slp_time_cycle_selection/periodic_rules/periodic_rule', object: project.rule, as: :periodic_rule
  end
end
