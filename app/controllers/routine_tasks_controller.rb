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

  def complete
    @routine_task = RoutineTask.find(params[:id])
    @routine_task.update(complete: !@routine_task.complete)

    redirect_to routine_path(@routine_task.routine)
  end

  def edit
    @routine_task = RoutineTask.find(params[:id])
    @routine = @routine_task.routine

  end

  def update
    @routine_task = RoutineTask.find(params[:id])
    @routine = @routine_task.routine
    @routine_task.update(routine_task_params)
    if @routine.save
      redirect_to routine_path(@routine)
    else
      render 'edit'
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
    params.require(:routine_task).permit(:requires_response, :complete, :detail)
  end
end
