class SessionsController < ApplicationController

  def index
    if current_user
      redirect_to user_path(current_user)
    else
      @login_error = "Incorrect email or password"
      render :index
    end
  end

  def geolocate
    params["position"].map! {|loc| loc.to_f }
    
    session[:coords] = params["position"]
    render json: {message: "location saved"}
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


