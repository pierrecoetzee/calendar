require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the AppointmentHelper. For example:

describe AppointmentHelper do

  fixtures :users

  before(:each){
  	session[:user_id] = users(:appearhere)
  }
  
  describe "the current user" do

    it "the logged in user from the session" do
      helper.current_user.should_not == nil
    end

  end
end
