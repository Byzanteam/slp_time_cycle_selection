require_dependency "slp_time_cycle_selection/application_controller"

module SlpTimeCycleSelection
  class PeriodicModuleDatesController < ApplicationController
    before_action :set_project
    before_action :set_module_date

    def show
    end

    def update
      if @module_date.update(module_date_params)
        render partial: 'slp_time_cycle_selection/periodic_module_dates/periodic_module_date',
               locals: { module_date: @module_date },
               layout: false
      else
        render_json_error(@module_date)
      end
    end

    private

    def module_date_params
      params.require(:periodic_module_date).permit(
        :id,
        :name,
        periodic_modules_attributes: [
          :id,
          :_destroy,
          options_attributes: [:id, :start_at, :end_at, :_destroy]
        ]
      )
    end

    def set_project
      @project = SlpTimeCycleSelection::Project.find(params[:project_id])
    end

    def set_module_date
      @module_date = @project.module_dates.find(params[:id])
    end
  end
end
