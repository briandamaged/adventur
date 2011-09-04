class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :logged_in?
  
  private
  
  def logged_in?
    current_user != nil
  end
  
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  
  def authorize()
    unless logged_in?
      redirect_to log_in_path, :notice => "Please log in"
      return false
    end
  end
end
