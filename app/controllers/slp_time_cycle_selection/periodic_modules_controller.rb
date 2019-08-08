require_dependency "slp_time_cycle_selection/application_controller"

module SlpTimeCycleSelection
  class PeriodicModulesController < ApplicationController
    before_action :set_project

    def index
      @periodic_modules = paginate @project.periodic_modules
      render layout: false
    end

    private

    def set_project
      @project = SlpTimeCycleSelection::Project.find(params[:project_id])
    end
  end
end
