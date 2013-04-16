class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name,
    :position_title, :experience_summary, :phone_number, :linkedin_url,
    :twitter_url, :role

  has_many :authorizations
  has_many :attached_files, :as => :attachment
  has_many :job_portals, :as => :candidate
  # collecting Users object
  def self.getObject(count)
    users = []
    count.each do |f|
      users << self.where(:id => f.candidate_id)
    end
    return users
  end
end
