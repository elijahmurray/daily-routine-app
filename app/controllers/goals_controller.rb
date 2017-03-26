class GoalsController < ApplicationController
  def index
    @goals = Goal.all.to_a
  end

  def new
    @goal = Goal.new
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)
    if @goal.save
      redirect_to goal_path(@goal)
    else
      render 'edit'
    end

  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goals_path
    else
      render 'new'
    end
  end

  private
  def goal_params
    params.require(:goal).permit(:name, :duration, :description)
  end
end
