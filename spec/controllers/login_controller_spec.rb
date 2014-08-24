require 'spec_helper'

describe LoginController do

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

  describe "GET 'authenticate'" do
    it "returns http success" do
      get 'authenticate'
      response.should be_success
    end
  end

end
