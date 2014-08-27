class Appointment < ActiveRecord::Base
	
  attr_accessible :end_date, :start_date, :status, :space_id

  belongs_to :space

  validates_presence_of :space_id

  validates_uniqueness_of :start_date, scope: [:start_date, :end_date, :space_id] 

  def day_range
  	{start_date: start_date, end_date: end_date }
  end

  def split_appointment(removal_range)

  	  ranges = []

  	  return ranges if day_range == removal_range

  	  if start_date < removal_range[:start_date] && end_date > removal_range[:end_date]
            
          ranges << {start_date: start_date, end_date:   removal_range[:start_date].advance(:days=> - 1)}

          ranges << {start_date: removal_range[:end_date].advance(:days=>1), end_date: end_date }   

      else

      	  ranges << {start_date: removal_range[:end_date].advance(:days => 1), end_date: end_date }  if start_date == removal_range[:start_date]
      	 
          ranges << {start_date: start_date, end_date: removal_range[:end_date].advance(:days=> -1 ) }  if end_date == removal_range[:end_date]
      	 
      end

      ranges
  end

end
