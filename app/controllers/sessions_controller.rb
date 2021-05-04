class SessionsController < ApplicationController
  

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to journals_path
    else
      @error = @user.errors.full_messages
      render :signup
    end
  end

  def logout
    session.clear
    redirect_to home_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
