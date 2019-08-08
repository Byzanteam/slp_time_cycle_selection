require_dependency "slp_time_cycle_selection/application_controller"

module SlpTimeCycleSelection
  class PeriodicModulesController < ApplicationController
    before_action :set_project
    before_action :set_periodic_module, only: [:destroy]

    def index
      @periodic_modules = paginate @project.periodic_modules
      render layout: false
    end

    def destroy
      @periodic_module.destroy

      head :no_content
    end

    private

    def set_project
      @project = SlpTimeCycleSelection::Project.find(params[:project_id])
    end

    def set_periodic_module
      @periodic_module = @project.periodic_modules.find(params[:id])
    end
  end
end
