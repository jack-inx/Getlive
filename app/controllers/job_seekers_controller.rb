class JobSeekersController < ApplicationController
  
  def all_jobs
    @all_jobs = JobPost.all
  end

  def apply_for_job
    @job_post_id = params[:id].to_i
    if not current_user
      flash[:notice] = "Please provide the following details to apply for a job"
      redirect_to apply_without_signup_path(@job_post_id)
    else
      exit
    end
  end

  def apply_without_signup
    @job_post_id = params[:id].to_i
    @user = UnregisteredUser.new
  end

  def create_unregistered_user
    @job_post_id = params[:id].to_i
    @recruiter = JobPost.find_by_id(@job_post_id).recruiter
    @user = UnregisteredUser.new(params[:unregistered_user])
    @existing_user = UnregisteredUser.find_by_email(params[:unregistered_user][:email])
    if @existing_user
      respond_to do |format|
        UserMailer.job_application_mail(@existing_user,@recruiter).deliver
        flash[:notice] = "User already exists."
        format.html { redirect_to root_path }
      end
    elsif @user.save!(:validate => false)
      flash[:notice] = "User created and you have successfully applied for this job."
      redirect_to all_jobs_path
    else
      redirect_to :back
    end
  end

end