class AppointmentController < ApplicationController

  def index
    @user = User.first
    @space = @user.spaces.last

  end

  def new
     @date = Date.today
  	 @user = User.first
  	 @space = @user.spaces.last
  	 # @appointment = @space.appointments.build({start_date: nil, end_date: nil })
     @appointments = @space.appointments

     render 'index'
  end

  def change_current
    respond_to do |format|
      format.json{ render json: Appointment.last.to_json  }
    end
  end

  def get_bookings
    @user   =  User.last
    @spaces = @user.spaces.last
    @appointments = @spaces.appointments
    
    render :json => @appointments.to_json

  end

  def update
    respond_to do |format|
    	format.html{  }
    end
  end

  def create

	@user = User.first
	@space = @user.spaces.last
	@appointment = @space.appointments.build({start_date: Date.today, end_date: Date.today.advance(:days => 7) })

    respond_to do |format|
    	if @appointment.save
    		format.js{ render :action => "success", :layout=>false }
    		format.html{ redirect_to new_user_space_appointment_path(@user.id, @space.id, @appointment.id)}
        end
    end
  end

end
