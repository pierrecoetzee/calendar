require 'spec_helper'

describe Appointment do
  
  fixtures [:users, :spaces, :appointments]

  describe 'methods of appointments' do
    it 'can return the day range of the instance' do
       appointment = Appointment.last
       appointment.respond_to?(:day_range).should be_truthy
    end
  end

  describe 'creating an appointment' do  	

  	it 'should always be for a space' do
  		expect{Appointment.create!({start_date: Date.today, end_date: Date.today.advance(:days=>4) })}.to raise_exception( ActiveRecord::RecordInvalid )
  	end

  	it 'should create an appointment for a space' do
  		valid_attrs= {start_date: Date.today, end_date: Date.today.advance(:days=>4) }
  		spaces(:user_one_space_1).appointments.build(valid_attrs).save.should be_truthy
  	end
  end

  describe 'removing a date inside a date drange' do


    before(:each){
      # today + 10 days
      @appointment = appointments(:user_1_space_1)
      @appointment.update_attributes({start_date: Date.today, end_date: Date.today.advance(:days => 10 )})
      @appointment.save
      @space = @appointment.space
    }

    it 'should have 2 sperate date ranges afterwards' do
        
        appointments = []

        removal_range = {start_date: Date.today.advance(:days=>1), end_date: Date.today.advance(:days=>2)}

        ranges = []

        if @appointment.start_date < removal_range[:start_date] && @appointment.end_date > removal_range[:end_date]
            
            ranges << {start_date: @appointment.start_date, 
                       end_date:   removal_range[:start_date].advance(:days=> - 1)}

            ranges << {start_date: removal_range[:end_date].advance(:days=>1) , 
                       end_date:   @appointment.end_date}    

            @appointment.delete
            @space.reload

            @space.appointments.build( ranges )  
            @space.save                 
        end

        ranges.length.should eq 2
        ranges.first.should eq( {start_date: @appointment.start_date ,
                                 end_date: removal_range[:start_date].advance(:days => -1)
                              })

        ranges.last.should eq( {start_date: removal_range[:end_date].advance(:days=>1) ,
                                 end_date: @appointment.end_date
                              })        

        @space.appointments.length.should eq 2

    end

    it 'should create 2 appointments from one' do
      
      removal_range = {start_date: Date.today.advance(:days=>1), end_date: Date.today.advance(:days=>2)}

      returned = [{:start_date=> @appointment.start_date , 
                  :end_date=> removal_range[:start_date].advance(:days => - 1)  }, 
                  {:start_date=> removal_range[:end_date].advance(:days=> 1), 
                   :end_date=> @appointment.end_date}]

      @appointment.split_appointment(removal_range).should eq(returned)

    end

    it 'returns no range when the dates are the exact ones to remove' do
        removal_range = {start_date: @appointment.start_date, end_date: @appointment.end_date}
        @appointment.split_appointment(removal_range).should eq []
    end

    it 'should return one new range if the end dates are the same' do
        removal_range = {start_date: @appointment.start_date.advance(:days=> 1), end_date: @appointment.end_date}
        returner = {:start_date=> @appointment.start_date ,:end_date=> removal_range[:end_date].advance(:days => -1) }       
        @appointment.split_appointment(removal_range).should eq( [returner] )
    end

    it 'should return one new range if the start dates are the same' do
        removal_range = {start_date: @appointment.start_date, end_date: @appointment.end_date.advance(:days=> -6)}
        returner = {:start_date=> removal_range[:end_date].advance(:days => 1) ,:end_date=> @appointment.end_date }       
        @appointment.split_appointment(removal_range).should eq( [returner] )
    end

  end

end








