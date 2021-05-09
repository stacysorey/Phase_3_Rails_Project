class SessionsController < ApplicationController
  #skip_before_action :verified_user, only: [:new, :create]


  def new
    #just creates a new session
  end

  def create
    @user = User.find_by(username:params[:user][:username])
    
      if !@user
        @error = "Username is incorrect"
        render :new
      elsif !@user.authenticate(params[:user][:password])
        @error = "Password is incorrect"
        render :new
      else
        flash[:message] = "Successfully signed in"
        session[:user_id] = @user.id
        redirect_to journals_path
      end
  end

  def logout
    session.clear
    redirect_to login_path
  end

end
