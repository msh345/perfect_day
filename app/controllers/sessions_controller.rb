class SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by(email: params[:users][:email])
    if user && user.authenticate(params[:users][:password])
      reset_session
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :index
    end
  end
end


