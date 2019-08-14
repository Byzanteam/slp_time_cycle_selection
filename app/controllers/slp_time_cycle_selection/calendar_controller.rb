require_dependency "slp_time_cycle_selection/application_controller"

module SlpTimeCycleSelection
  class CalendarController < ApplicationController
    before_action :set_project

    def periodic_dates
      periodic_dates = @project.rule.calculate_periodic_dates

      render json: { periodic_dates: periodic_dates }, layout: false
    end

    private

    def set_project
      @project = SlpTimeCycleSelection::Project.find(params[:project_id])
    end
  end
end
