class RoutineLogsController < ApplicationController
  def new
    @routine = Routine.find(params[:routine_id])
    @routine_log = @routine.routine_logs.new
    @routine_log.save

    @routine.reset
    redirect_to @routine
  end
end
