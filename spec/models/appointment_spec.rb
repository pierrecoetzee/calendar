require 'spec_helper'

describe Appointment do
  describe 'creating an appointment' do

  	fixtures [:users, :spaces, :appointments]

  	it 'should always be for a space' do
  		expect{Appointment.create!({start_date: Date.today, end_date: Date.today.advance(:days=>4) })}.to raise_exception( ActiveRecord::RecordInvalid )
  	end

  	it 'should create an appointment for a space' do
  		valid_attrs= {start_date: Date.today, end_date: Date.today.advance(:days=>4) }
  		spaces(:user_one_space_1).appointments.build(valid_attrs).save.should be_truthy
  	end
  end

end
