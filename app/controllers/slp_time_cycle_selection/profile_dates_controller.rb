require_dependency "slp_time_cycle_selection/application_controller"

module SlpTimeCycleSelection
  class ProfileDatesController < ApplicationController
    before_action :set_project

    def show
      @profile_date = @project.profile_date
    end

    private

    def set_project
      @project = SlpTimeCycleSelection::Project.find(params[:project_id])
    end
  end
end
