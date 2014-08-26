class SpaceController < ApplicationController

  before_filter :authenticate_user!
  
  def index
     @spaces = current_user.spaces
  end

end
