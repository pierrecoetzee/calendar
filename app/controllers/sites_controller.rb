class SitesController < ApplicationController

  def index
     @sites = current_user.spaces
  end

end
