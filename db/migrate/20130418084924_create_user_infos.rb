class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.integer :country_id
      t.integer :state_id
      t.string :city
      t.string :zipcode
      t.integer :years_of_exp
      t.text :brief_summary
      t.string :employment_status
      t.date :available_to_join
      t.string :edu_level
      t.string :university
      t.string :employment_type
      t.boolean :security_clearance
      t.string :sal_expectation
      t.string :hourly_expectation
      t.boolean :relocation_interest
      t.string :work_authorization
      t.string :willing_to_travel

      t.timestamps
    end
  end
end
