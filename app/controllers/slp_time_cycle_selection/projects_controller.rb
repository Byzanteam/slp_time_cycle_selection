require_dependency "slp_time_cycle_selection/application_controller"

module SlpTimeCycleSelection
  class ProjectsController < ApplicationController
    def index
      @projects = paginate SlpTimeCycleSelection::Project.all

      render layout: false
    end
  end
end
