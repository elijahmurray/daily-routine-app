class PagesController < ApplicationController
  def home
    @routines = Routine.all.to_a
    @goals = Goal.all.to_a
  end
end
