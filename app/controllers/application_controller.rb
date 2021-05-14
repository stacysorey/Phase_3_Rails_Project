class ApplicationController < ActionController::Base
  include ApplicationHelper
  

  private 
  
  def require_login
    redirect_to login_path if !logged_in?
  end
  
end
