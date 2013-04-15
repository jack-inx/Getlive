class UnregisteredUser < ActiveRecord::Base

  attr_accessible :email, :first_name, :last_name, :phone_number, :message
  has_many :attached_files, :as => :attachment

#  has_attached_file :attachedfile

  validate :email, :uniqueness => true, :presence => true

  
end
