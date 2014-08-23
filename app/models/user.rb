class User < ActiveRecord::Base
  attr_accessible :password, :user_name
end
