class JobPost < ActiveRecord::Base

  attr_accessible :job_title, :position, :country_id, :state_id, :city, :zip_code, :salary,
    :term_of_assignment, :length, :job_description, :recruiter_id

  belongs_to :recruiter

  belongs_to :job_post

  belongs_to :country
  
  belongs_to :state

end
