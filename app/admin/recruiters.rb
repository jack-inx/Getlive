ActiveAdmin.register Recruiter do

  index do
    column :email
    column :first_name
    column :last_name
    column :position_title
    column :experience_summary
    column :phone_number
    column :linkedin_url
    column :twitter_url
    default_actions
  end

  form do |f|
    f.inputs "New Recruiter" do
      f.input :email
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
      #      f.input :password
      #      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :position_title
      f.input :experience_summary
      f.input :phone_number
      f.input :linkedin_url
      f.input :twitter_url
    end
    #    f.inputs "Content" do
    #      f.input :body
    #    end
    f.buttons
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :position_title
  filter :phone_number
  filter :linkedin_url
  filter :twitter_url
end
