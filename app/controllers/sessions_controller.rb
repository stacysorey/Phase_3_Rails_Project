class SessionsController < ApplicationController
  #skip_before_action :verified_user, only: [:new, :create]

  #giving me access to journals index when not signed in 


  def new
    #just creates a new session
  end

  def create
    @user = User.find_by(email:params[:user][:email])
    if !@user
      @error = "Email is incorrect"
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

  def google
    #isn't letting me sign in -- keeps redirecting to login
    @user = User.find_or_create_by(email: auth["info"]["email"]) do |u|
      u.email = auth["info"]["email"]
      u.username = auth["info"]["name"]
      u.name = auth["info"]["name"]
      u.password = SecureRandom.hex(8)
    end
  
    if @user.valid?
      flash[:messsage] = "Signed In with Google"
      session[:user_id] = @user.id
      redirect_to journals_path
    else
      flash[:message] = "Credential Error"
      redirect_to login_path
    end
  end 

  private 

    def auth
        request.env['omniauth.auth']
    end 

end
