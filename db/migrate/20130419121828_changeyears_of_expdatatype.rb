class ChangeyearsOfExpdatatype < ActiveRecord::Migration
  def change
    change_column :user_infos, :years_of_exp, :string
  end
end
