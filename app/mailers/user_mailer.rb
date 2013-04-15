class UserMailer < ActionMailer::Base
  
  default :from => "admin@gumcard.com"
  
  def job_application_mail(unregistered_user,recruiter, file_path, file_name)
    @user = unregistered_user
    @recruiter = recruiter
    attachments["#{file_name}"] = File.read(file_path)
    mail(:to => @user.email, :subject => "Job Application Confirmation")
    mail(:to => @recruiter.email, :subject => "Job Application Confirmation")
  end

end