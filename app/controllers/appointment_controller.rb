class AppointmentController < ApplicationController

  before_filter :authenticate_user!
  
  def new
    # @user = User.first
    # @space = @user.spaces.last
  end

  def index
     
     @date = Date.today.beginning_of_month
  	 @user = current_user
  	 @space = Space.find(params[:space_id])
  	 @appointment = @space.appointments
    
  end

  def change_current
    respond_to do |format|
      format.json{ render json: Appointment.last.to_json  }
    end
  end

  def get_bookings

    @space =  Space.find(params[:id])
    @appointments = @space.appointments
    render :json => @appointments.to_json

  end

  def update
    respond_to do |format|
    	format.html{  }
    end
  end

  def create

	  @user = User.first
	  @space = Space.find params[:space_id]

    @start = Date.parse params[:start_date]
    @end   = params[:end_date].present? ? Date.parse(params[:end_date]) : @start

    @error = []

    if params[:state].to_i == 1

      if @space.appointments.where('start_date >=? and end_date <=?', @start, @end).empty?
	      @appointment = @space.appointments.build({start_date: @start, end_date: @end}) 
        @appointment.save
      else
        @error << 'already saved'
      end

    else
      
    end

    respond_to do |format|
    	if @error.empty?
    		format.js{ render :action => "success", :layout=>false }
    		format.html{ redirect_to new_user_space_appointment_path(@user.id, @space.id, @appointment.id)}
      else
        format.js{ render action: "error", :layout=>false }
      end
    end
  end

end
