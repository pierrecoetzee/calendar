class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  def authenticate_user!
  	redirect_to login_page_path unless session[:user_id]
  end

  def current_user
  	 return @current_user ||= User.find(session[:user_id]) if session[:user_id]
  	 nil
  end


end
