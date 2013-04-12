class RenameCountryAndState < ActiveRecord::Migration
  def change
    rename_column :job_posts, :country, :country_id
    rename_column :job_posts, :state, :state_id
    change_table :job_posts do |t|
      t.change :country_id, :integer
      t.change :state_id, :integer
    end
  end
end
