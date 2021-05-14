class UsersController < ApplicationController
  

  #sign up: create new user
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:message] = "User created successfully"
      session[:user_id] = @user.id
      redirect_to journals_path
    else
      @error = @user.errors.full_messages
      render :new
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :username, :password)
  end

end
