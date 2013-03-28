class JobPostsController < ApplicationController

  def job_post
    @job_post = JobPost.new
  end

  def create_job
    @job_post = current_recruiter.job_posts.new(params[:job_post])
#    p 'ssssssssssssssssssssssss'
#    p current_recruiter.id
#    exit
    if @job_post.save!
      flash[:notice] = "User successfully created"
      redirect_to show_jobs_path
    else
      redirect_to :back
    end
  end

  def show_jobs
    @id = current_recruiter.id
    @jobs = JobPost.find_all_by_recruiter_id(@id)
  end

end

