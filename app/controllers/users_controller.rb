class UsersController < ApplicationController
  def show
    # @itineraries = current_user.itineraries
  end

  def create
    @user = User.new(user_params)
    if @user.save
      create_session
      redirect_to @user
    else
      @signup_errors = @user.errors.full_messages
      render 'sessions/index'
    end
  end

  private
    def user_params
      params.require(:signup).permit(:username, :email, :password, :password_confirmation)
    end
end
