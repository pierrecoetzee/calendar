require 'spec_helper'

describe User do 

  describe 'create a new user' do
  	 
  	 before(:each){
  	 	@user = User.new({ email: 'testing@gmail.com', password: 'testing' })
  	 }

  	 it 'should create a user without an issue' do
  	 	expect(@user.save).to be_truthy
  	 end

  	 it 'should have public accessible attributes' do
        [:email, :password].each{|attr_name|
    			@user.should respond_to attr_name
        }
  	 end

  	 it 'should create any space for the user' do
  	 	
  	 	expect{
  	 	   @user.spaces.build({description: 'some desc'}).save
  	 	}.to change{@user.spaces.length}.by 1

  	 end
  end
	
end