class SessionsController < ApplicationController
  def index
    if current_user
      redirect_to user_path(current_user)
    end
  end

  def create
    user = User.find_by(email: params[:users][:email])
    if user && user.authenticate(params[:users][:password])
      reset_session
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @login_error = "Incorrect email or password"
      render :index
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end


