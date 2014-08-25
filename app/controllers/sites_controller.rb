class SitesController < ApplicationController

  before_filter :authenticate_user!
  
  def index
     @sites = current_user.spaces
  end

end
