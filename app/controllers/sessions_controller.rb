class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user and user.authenticate params[:session][:password]
      login user
      redirect_to admin_root_path
    else
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end