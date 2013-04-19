class JobPostsController < ApplicationController
  layout :recruiter
  def job_post
    @job_post = JobPost.new
    @job_post.job_post_and_skills.new
  end

  def create_job

    @job_post = current_recruiter.job_posts.new(params[:job_post])
    #    p 'ssssssssssssssssssssssss'
    #    p current_recruiter.id
    #    exit
    if @job_post.save!
      parameters = params[:job_post][:job_post_and_skills_attributes]
      parameters.each do |f|
        @job_post.job_post_and_skills.create(:skill_id =>f[1][:id])
      end

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

  # Recruitor's accessibility action
  def my_post
    @recruitor = current_recruiter
    @all_post = @recruitor.job_posts
  end

  def show_applied_candidate
    # List of candidate who have applied to a job
    list = JobPost.where(:recruiter_id=>current_recruiter.id,:id=>params[:id])
    if not list.empty?
      @candidate_list = JobPortal.candidate_list(list.first)
    else
      flash[:notice] = "Access permission is not allowed"
      redirect_to :my_post
    end
  end

  def candidate_details
    if params[:type].eql?('user')
      @candidate = User.find params[:id]
      @file = file =Rails.root.join('public'+ @candidate.attached_files.last.dumpfile.to_s)
      file = file.to_s.split('?')[0]
       
        @filename = @candidate.attached_files.last.dumpfile
     
    else
      @candidate = UnregisteredUser.find params[:id]
      
       @filename = @candidate.attached_files.last.dumpfile_file_name
       @type = @candidate.attached_files.last.dumpfile_content_type
      
    end
  end

end

