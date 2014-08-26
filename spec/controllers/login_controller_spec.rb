require 'spec_helper'

describe LoginController do

  fixtures :all

  before(:each){
    @user = users(:appearhere)
    session[:user_id] = @user.id
  }

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'authenticate'" do
    it "redirects a logged in user to the management page" do
      get :authenticate, "user"=>{"email"=>@user.email, "password"=> @user.password}
      response.should redirect_to(:space_index)
    end
  end

end
