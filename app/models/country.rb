class Country < ActiveRecord::Base
  has_many :states
  belongs_to :job_post
end
