require_dependency "slp_time_cycle_selection/application_controller"

module SlpTimeCycleSelection
  class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :destroy, :update]

    def index
      respond_to do |format|
        format.html
        format.json do
          @projects = paginate SlpTimeCycleSelection::Project.all
          render layout: false
        end
      end
    end

    def create
      @project = SlpTimeCycleSelection::Project.new(project_params)

      if @project.save
        render layout: false, status: :created
      else
        render_json_error @project
      end
    end

    def show
      respond_to do |format|
        format.html
        format.json
      end
    end

    def update
      if @project.update project_params
        render partial: 'slp_time_cycle_selection/projects/project', locals: { project: @project }, layout: false
      else
        render_json_error @project
      end
    end

    def destroy
      @project.destroy

      head :no_content
    end

    private

    def project_params
      params.require(:project).permit(:id, :name, :delay_minutes, :delay_minute_unit)
    end

    def set_project
      @project = SlpTimeCycleSelection::Project.find(params[:id])
    end
  end
end
