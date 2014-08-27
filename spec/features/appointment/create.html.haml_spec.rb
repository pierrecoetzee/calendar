require 'spec_helper'

describe "appointment/create.html.haml" do
  
  include LoginSteps
  include WaitSteps

  fixtures :all

  before(:each){
  	@user = users(:appearhere)
  	login_as_admin_for @user
  }

  describe 'booking a space' do 

  	it 'visually changes on the screen after a succesfull booking' do
  		
  		page.should have_content('Below Wolf and Badger')
  		page.all('a')[1].trigger 'click'

  		find('.calendar_form').should_not be_falsy

  		all(".day.booked").size.should == 0

  		fill_in 'start_date', with: Date.today.beginning_of_month.strftime("%d/%m/%Y")
  		fill_in 'end_date', with: Date.today.end_of_month.strftime("%d/%m/%Y")
  		click_button 'Update calendar'

  		sleep 3.seconds
 		  all('.day.booked').size.should == Date.today.end_of_month.day

  	end
  end
end
