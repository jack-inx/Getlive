class CreateJobPostAndSkills < ActiveRecord::Migration
  def change
    create_table :job_post_and_skills do |t|
      t.references :job_post, :null => false
      t.references :skill, :null => false

      t.timestamps
    end
    add_index(:job_post_and_skills, [:job_post_id, :skill_id])
  end
end
