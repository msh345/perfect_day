class SessionsController < ApplicationController
  
  def index
    if current_user
      redirect_to user_path(current_user)
    else
      @login_error = "Incorrect email or password"
      render :index
    end
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end

#  For bCrypt Authorization
#  ========================

#   def create
#     @user = User.find_by(email: params[:users][:email])
#     if @user && @user.authenticate(params[:users][:password])
#       create_session
#       redirect_to @user
#     else
#       @login_error = "Incorrect email or password"
#       render :index
#     end
#   end

#   def destroy
#     reset_session
#     redirect_to root_path
#   end


