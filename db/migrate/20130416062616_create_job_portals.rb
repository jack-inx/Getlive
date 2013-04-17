class CreateJobPortals < ActiveRecord::Migration
  def change
    create_table :job_portals do |t|
      t.integer :candidate_id
      t.string  :candidate_type
      t.references :job_post
      
      t.timestamps
    end
  end
end
