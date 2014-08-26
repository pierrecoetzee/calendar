require 'spec_helper'

describe "space/index.html.haml" do

    include LoginSteps

    fixtures :all

    it 'lists all the spaces for the logged in user' do
    	# login_as_admin_for users(:appearhere)
    	visit 'login/index'
    end
end
