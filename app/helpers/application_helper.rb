module ApplicationHelper

  def current_user
    @user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def format_created_at(obj)
    date = obj.created_at.to_date
    date.strftime("%m.%d.%Y")
  end

  def format_date(obj)
    date = obj.date
    date.strftime("%m.%d.%Y")
  end

end
