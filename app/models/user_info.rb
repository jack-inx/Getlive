class UserInfo < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  belongs_to :state

  attr_accessible :first_name, :last_name, :user_id, :job_title,
    :country_id, :state_id, :city, :zipcode, :years_of_exp, :brief_summary, :employment_status,
    :available_to_join, :edu_level, :university, :employment_type, :security_clearance,
    :sal_expectation, :hourly_expectation, :relocation_interest, :work_authorization, :willing_to_travel

# validates :first_name, :last_name, :user_id, :job_title,
# :country_id, :state_id, :city, :zipcode, :years_of_exp, :brief_summary, :employment_status,
# :available_to_join, :edu_level, :university, :employment_type, :security_clearance,
# :sal_expectation, :hourly_expectation, :relocation_interest, :work_authorization, :willing_to_travel, :presence => {:message => "Cant be blank"}
#has_one :attached_files, :as => :attachment

end
