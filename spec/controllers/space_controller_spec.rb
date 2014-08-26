require 'spec_helper'

describe SpaceController do

  describe "GET 'index'" do

    fixtures :all

    before(:each){
     @user = users(:appearhere)
     session[:user_id] = @user.id
    }

    it "returns http success" do

      get 'index'
      
      response.should be_success
      
      assigns(:spaces).should == @user.spaces

    end
  end

end
