class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      reset_session
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end



end
