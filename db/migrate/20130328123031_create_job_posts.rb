class CreateJobPosts < ActiveRecord::Migration
  def change
    create_table :job_posts do |t|
      t.integer :recruiter_id
      t.string :job_title
      t.string :position
      t.string :country
      t.string :state
      t.string :city
      t.string :zip_code
      t.integer :salary
      t.string :term_of_assignment
      t.string :length
      t.text :job_description

      t.timestamps
    end
  end
end
