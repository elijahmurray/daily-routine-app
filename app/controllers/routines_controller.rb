class RoutinesController < ApplicationController
  before_filter :set_view_id
  before_action :authenticate_user!

  def index
    @routines = current_user.routines
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
    @routine.destroy

    redirect_to routines_path
  end
  
  def create
    @routine = current_user.routines.new(routine_params)

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
    params.require(:routine).permit(:name, :repeat_frequency)
  end

  def set_view_id
    @controller_class = "routine-page"
  end
end
