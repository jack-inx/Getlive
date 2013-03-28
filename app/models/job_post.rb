class JobPost < ActiveRecord::Base

  attr_accessible :job_title, :position, :country, :state, :city, :zip_code, :salary, 
    :term_of_assignment, :length, :job_description, :recruiter_id

  belongs_to :recruiter
  
end
