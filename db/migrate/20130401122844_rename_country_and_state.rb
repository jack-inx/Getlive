class RenameCountryAndState < ActiveRecord::Migration
  def change
    change_column :job_posts, :country, :integer
    change_column :job_posts, :state, :integer
    rename_column :job_posts, :country, :country_id
    rename_column :job_posts, :state, :state_id
  end
end
