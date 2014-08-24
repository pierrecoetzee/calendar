class User < ActiveRecord::Base

  attr_accessible :password, :email

  has_many :spaces

end
