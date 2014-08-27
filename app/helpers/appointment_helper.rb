module AppointmentHelper

	def current_user
        return @current_user = User.find(session[:user_id]) if session[:user_id].present?
        nil
	end

	def wday_class(week_day)
		if week_day.is_a?(Date)
			return 'end' if week_day.wday.eql? 1
		end
	end

end
