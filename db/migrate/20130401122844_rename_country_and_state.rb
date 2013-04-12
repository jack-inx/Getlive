class RenameCountryAndState < ActiveRecord::Migration
  def change
    rename_column :job_posts, :country, :country_id
    rename_column :job_posts, :state, :state_id
    
  end
end
