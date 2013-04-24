class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name,
    :position_title, :experience_summary, :phone_number, :linkedin_url,
    :twitter_url, :role, :signup_status

  has_many :authorizations
  has_many :attached_files, :as => :attachment
  has_many :job_portals, :as => :candidate
  has_one :user_info

  before_create :generate_confirmation_token#, :if => :confirmation_required?  # Generate confirmation token when user creates.

  after_create  :send_on_create_confirmation_instructions, :if => :confirmation_required_create?   # Email not goes just after user creation
  # collecting Users object
  def self.getObject(count)
    users = []
    count.each do |f|
      users << self.where(:id => f.candidate_id)
    end
    return users
  end

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.hex(16)
    self.confirmed_at = nil
  end

  protected

  def send_on_create_confirmation_instructions
    self.devise_mailer.confirmation_instructions(self).deliver
  end

  # Callback to overwrite if confirmation is required or not.
  def confirmation_required?
    puts !confirmed?
  end

  def confirmation_required_create?
    #        !confirmed?
    return false
  end

end
