class Appointment < ActiveRecord::Base
	
  attr_accessible :end_date, :start_date, :status, :space_id

  belongs_to :space

  validates_presence_of :space_id

  validates_uniqueness_of :start_date, scope: [:start_date, :end_date] 

end
