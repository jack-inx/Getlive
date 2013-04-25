class Recruiter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name,:position_title, :experience_summary,
                  :phone_number, :linkedin_url, :twitter_url

  
  # Associations
  has_many :job_posts, :dependent => :destroy

  # Validations
  validates :phone_number, :length =>{:within => 7..10}
  validates :email, {:uniqueness => true }

  validates :first_name, presence: true 
  # Methods
  def full_name
    "#{first_name} #{last_name}"
  end

end
