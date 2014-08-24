class LoginController < ApplicationController
  
  skip_before_filter :authenticate_user!
  
  def index
  	# default login screen
  end

  def authenticate
  	 
  	 user = User.find_by_email_and_password(params[:user][:email], params[:user][:password])
     
     respond_to do |format|
     	if user
     	  session[:user_id] = user.id
     	  format.html{ redirect_to sites_index_path }
        end
     end
     
  end

  def logout
  	session.delete :user_id 
    redirect_to login_page_path
  end

end
