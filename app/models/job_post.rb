class JobPost < ActiveRecord::Base

  attr_accessible :job_title, :position, :country_id, :state_id, :city, :zip_code, :salary,
    :term_of_assignment, :length, :job_description, :recruiter_id, :job_post_and_skills

  belongs_to :recruiter

  # belongs_to :job_post

  has_one :country

  has_one :state
  has_many :job_post_and_skills, :dependent => :destroy

  # has_and_belongs_to_many :skills
  accepts_nested_attributes_for :job_post_and_skills#, :reject_if => lambda { |a| a.values.all?(&:blank?) }
end
