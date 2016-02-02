class HomeController < ApplicationController
  def index
    if logged_in?
      @activities = current_user.activities
    end
  end
end