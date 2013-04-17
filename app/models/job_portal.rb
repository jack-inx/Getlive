class JobPortal < ActiveRecord::Base
  belongs_to :candidate, :polymorphic => true
  belongs_to :job_post
  
  def self.candidate_list(job)
    return (self.type_user(job) +  self.type_unregistered_user(job)).flatten
  end

  def self.type_user(job)
    count = self.find_all_by_job_post_id_and_candidate_type(job,'User')
    
    if not count.blank?
      return User.getObject(count)
    else
      return count
    end
  end

  def self.type_unregistered_user(job)

    count = self.find_all_by_job_post_id_and_candidate_type(job,'UnregisteredUser')
    
    if not count.blank?
      return UnregisteredUser.getObject(count)
    else
      return count
    end
  end
end
