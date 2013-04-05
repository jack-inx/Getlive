class UserMailer < ActionMailer::Base
  
  default :from => "admin@gumcard.com"
  
  def job_application_mail(unregistered_user,recruiter)
    @user = unregistered_user
    @recruiter = recruiter
    mail(:to => @user.email, :subject => "Job Application Confirmation")
    mail(:to => @recruiter.email, :subject => "Job Application Confirmation")
  end

end