class JobPostAndSkill < ActiveRecord::Base
  belongs_to :job_post
  belongs_to :skill
end
