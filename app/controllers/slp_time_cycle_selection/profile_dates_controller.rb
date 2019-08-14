require_dependency "slp_time_cycle_selection/application_controller"

module SlpTimeCycleSelection
  class ProfileDatesController < ApplicationController
    before_action :set_project

    def show
      @profile_date = @project.profile_date
    end

    def update
      workday = params[:workday]
      holiday = params[:holiday]
      profile_date = @project.profile_date

      if workday
        profile_date.set_workday(workday)
      else
        profile_date.set_holiday(holiday)
      end
      render partial: 'slp_time_cycle_selection/profile_dates/profile_date',
             locals: { profile_date: profile_date },
             layout: false
    end

    private

    def set_project
      @project = SlpTimeCycleSelection::Project.find(params[:project_id])
    end
  end
end
