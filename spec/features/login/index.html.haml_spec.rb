require 'spec_helper'

describe "space/index.html.haml" do

    include LoginSteps

    fixtures :all

    it 'lists all the spaces for the logged in user' do
       login_as_admin_for users(:appearhere)
       
       page.should have_css(".table.table-striped")
       page.should have_content('Below Wolf and Badger Dover Street')
       page.should have_content('An immaculate retail unit located on the Kings Road, Chelsea')
       
       all('td').size.should == 18
       all('tr').size.should == 6
    end
end
