class User < ActiveRecord::Base

  attr_accessible :password, :user_name

  has_many :spaces

end
