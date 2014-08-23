require 'spec_helper'

describe Space do
  
    describe "creating a space" do 

    	fixtures [:users, :spaces]

    	it 'should create a space for a user' do
    	  expect{Space.create!({description: 'test desr for this space'})}.to raise_exception(ActiveRecord::RecordInvalid)
    	end

    	it 'should successfully create a space based on a user' do
    		spaces = users(:pierrecoetzee).spaces.build({ description: 'this is a space for pierre' })
    		spaces.save.should be_truthy
    	end
    end

end
