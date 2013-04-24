class ChangeAvailableDateToStringJobseeker < ActiveRecord::Migration
  def change
    change_column :user_infos, :available_to_join, :string
  end
end
