class Space < ActiveRecord::Base
  
  attr_accessible :user_id, :description, :appointment_id

  belongs_to :user
  has_many :appointments

  validates_presence_of :user_id

end
