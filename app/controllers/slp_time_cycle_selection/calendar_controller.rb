require_dependency "slp_time_cycle_selection/application_controller"

module SlpTimeCycleSelection
  class CalendarController < ApplicationController
    before_action :set_project

    def periodic_dates
      periodic_dates = @project.rule.calculate_periodic_dates

      filter_dates =
        if params[:start_date] && params[:end_date]
          periodic_dates.select do |date|
            date >= Date.parse(params[:start_date]) && date < Date.parse(params[:end_date])
          end
        elsif params[:start_date]
          periodic_dates.select do |date|
            date >= Date.parse(params[:start_date])
          end
        elsif params[:end_date]
          periodic_dates.select do |date|
            date < Date.parse(params[:end_date])
          end
        else
          periodic_dates
        end

      render json: { periodic_dates: filter_dates }, layout: false
    end

    private

    def set_project
      @project = SlpTimeCycleSelection::Project.find(params[:project_id])
    end
  end
end
