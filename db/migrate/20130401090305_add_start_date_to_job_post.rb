class AddStartDateToJobPost < ActiveRecord::Migration
  def change
    add_column :job_posts, :start_date, :timestamp
  end
end
