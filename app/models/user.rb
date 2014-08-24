class User < ActiveRecord::Base

  attr_accessible :password, :user_name, :email

  has_many :spaces

end
