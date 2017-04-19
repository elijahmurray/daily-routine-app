class RoutineLogsController < ApplicationController
  def new
    @routine = Routine.find(params[:routine_id])
    # create blank log
    # copy over each routine_task
    # save
    # reset main routine
    redirect_to @routine
  end
end
