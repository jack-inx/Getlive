class AddFieldsToRecruiters < ActiveRecord::Migration
  def change
    add_column :recruiters, :first_name, :string
		add_column :recruiters, :last_name, :string
		add_column :recruiters, :position_title, :string
    add_column :recruiters, :experience_summary, :text
    add_column :recruiters, :phone_number, :integer
    add_column :recruiters, :linkedin_url, :string
    add_column :recruiters, :twitter_url, :string
  end
end
