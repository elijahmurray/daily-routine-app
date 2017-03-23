class RoutineTasksController < ApplicationController
  def new
    @routine = Routine.find(params[:routine_id])
    @routine_task = @routine.routine_tasks.new
  end

  def create
    @routine = Routine.find(params[:routine_id])
    @routine_task = @routine.routine_tasks.create(routine_task_params)

    if @routine_task.save
      redirect_to @routine
    else
      render 'new'
    end
  end

  def destroy
    @routine_task = RoutineTask.find(params[:id])
    @routine = @routine_task.routine

    @routine_task.delete
    redirect_to routine_path(@routine)
  end

  private
  def routine_task_params
    params.require(:routine_task).permit(:task_type, :complete, :detail)
  end
end
