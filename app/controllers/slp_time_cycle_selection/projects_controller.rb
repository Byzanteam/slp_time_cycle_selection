require_dependency "slp_time_cycle_selection/application_controller"

module SlpTimeCycleSelection
  class ProjectsController < ApplicationController
    before_action :set_project, only: [:show]

    def index
      respond_to do |format|
        format.html
        format.json do
          @projects = paginate SlpTimeCycleSelection::Project.all
          render layout: false
        end
      end
    end

    def show
      respond_to do |format|
        format.html
        format.json
      end
    end

    private

    def set_project
      @project = SlpTimeCycleSelection::Project.find(params[:id])
    end
  end
end
