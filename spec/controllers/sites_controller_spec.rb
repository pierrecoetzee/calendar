require 'spec_helper'

describe SitesController do

  describe "GET 'def'" do
    it "returns http success" do
      get 'def'
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
