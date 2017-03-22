class RoutinesController < ApplicationController
  def index
    @routines = Routine.all
  end

  def edit
    @routine = Routine.find(params[:id])
  end

  def update
    @routine = Routine.find(params[:id])
    if @routine.update(routine_params)
      redirect_to @routine
    else
      render "edit"
    end
  end

  def new
    @routine = Routine.new
  end

  def destroy
    @routine = Routine.find(params[:id])
    @routine.delete

    redirect_to routines_path
  end
  
  def create
    @routine = Routine.new(routine_params)

    if @routine.save
      redirect_to @routine
    else
      render home_path
    end
  end

  def show
    @routine = Routine.find(params[:id])
  end

  private
  def routine_params
    params.require(:routine).permit(:name, :frequency)
  end
end
