module AppointmentHelper

	def current_user
        return @current_user = User.find(session[:user_id]) if session[:user_id].present?
        nil
	end

end
