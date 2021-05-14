class SessionsController < ApplicationController
  
#destroy sesssion after ending?? 


  def new
    #just creates a new session
  end

  def create
    @user = User.find_by(email:params[:user][:email])
    if !@user
      @error = "email is incorrect"
      render :new
    elsif !@user.authenticate(params[:user][:password])
      @error = "password is incorrect"
      render :new
    else
      flash[:message] = "successfully signed in"
      session[:user_id] = @user.id
      redirect_to journals_path
    end
  end

  def logout
    session.clear
    redirect_to login_path
  end

  def google
    
    #won't let me login "credentials error"
    @user = User.find_or_create_by(email: auth[:info][:email]) do |u|
      
      u.email = auth[:info][:email]
      u.username = auth[:info][:name]
      u.name = auth[:info][:name]
      u.password = SecureRandom.hex(8)
    end
  
    if @user.valid?
      flash[:messsage] = "signed in with Google"
      session[:user_id] = @user.id
      redirect_to journals_path
    else
      flash[:message] = "credential error"
      redirect_to login_path
    end
  end 

  private 

    def auth
        request.env['omniauth.auth']
    end 

end
