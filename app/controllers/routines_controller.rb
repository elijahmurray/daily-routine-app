class RoutinesController < ApplicationController
  def index
    @routines = Routine.all
  end

  def new
    @routine = Routine.new
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
