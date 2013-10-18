class UsersController < ApplicationController
  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      session[:user_id] = @user.id
      redirect_to @user
    else
      @signup_errors = @user.errors.full_messages
      render sessions_path
    end
  end

  private
    def user_params
      params.require(:signup).permit(:username, :email, :password, :password_confirmation)
    end
end
