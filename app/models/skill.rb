class Skill < ActiveRecord::Base
  #has_and_belongs_to_many :job_posts
  has_many :job_post_and_skills
end
