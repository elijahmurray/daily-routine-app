class PagesController < ApplicationController
  def home
    if user_signed_in?
      @routines = current_user.routines
      @goals = current_user.goals
    end
  end
end
