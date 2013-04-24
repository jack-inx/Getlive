class Country < ActiveRecord::Base
  has_many :states
  has_one :job_post
  has_one :user_info
end
