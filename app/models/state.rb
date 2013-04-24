class State < ActiveRecord::Base
  belongs_to :country
  has_one :user_info
end
