require 'spec_helper'

describe AppointmentController do

  fixtures :all

  before(:each){
    @user = User.first
    @space = @user.spaces.first
  }

  context 'Admin not logged in' do  
    it 'should not allow anyone to access the appointments' do
        get :index, {user_id: @user.id ,space_id: @space.id}
        response.should_not be_success
    end
  end

  context 'Admin is authenticated' do

    before(:each){
     session[:user_id] = User.first.id
    }

    describe "GET 'index'" do

      it "returns http success" do
        get :index ,{user_id: @user.id ,space_id: @space.id}
        response.should be_success
        assigns(:date).should == Date.today.beginning_of_month
        assigns(:user).should eq(@user)
      end

    end

    describe 'in order to judge the available dates quickly' do
      it 'should show a spaces available dates' do
        xhr :get, :get_bookings, {
            id: @space.id,
            date: Date.today
        }

        JSON.parse(response.body).should == JSON.parse(@space.appointments.to_json)
      end
    end

    describe 'changing availability of a space' do
      it 'should allow the removal of availability' do

        appointment_to_change = @space.appointments.last

        expect{
           xhr :post, :change_current, 
                  { space_id: @space.id,
                    start_date: Date.today.beginning_of_month.advance(:days=> 10),
                    end_date:  Date.today.beginning_of_month.advance(:days=> 20)
                  }
           assigns(:range).length.should == 2
        }.to change{@space.appointments.count}.by 1                                                         

      end
    end
  end

end







