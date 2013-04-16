class UnregisteredUser < ActiveRecord::Base

  attr_accessible :email, :first_name, :last_name, :phone_number, :message
  has_many :attached_files, :as => :attachment
  has_many :job_portals, :as => :candidate

  #  has_attached_file :attachedfile

  validate :email, :uniqueness => true, :presence => true
  
  # Collecting Unregistered users 
  def self.getObject(count)
    users = []
    count.each do |f|
      users << self.where(:id => f.candidate_id)
    end
    return users
  end
end
