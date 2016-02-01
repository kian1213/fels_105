class HomeController < ApplicationController
  def index
    if logged_in?
      @lessons = current_user.lessons
    end
  end
end