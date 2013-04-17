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

  # Recruitor's accessibility action

  def show_applied_candidate
    # List of candidate who have applied to a job
    @recruitor = current_recruiter
    @job_post_id = @recruitor.job_posts.first.id
    @candidate_list = JobPortal.candidate_list(@job_post_id)
  end

  def candidate_details
    if params[:type].eql?('user')
      @candidate = User.find params[:id]
      file =Rails.root.join('public'+ @candidate.attached_files.last.dumpfile.to_s)
      file = file.to_s.split('?')[0]
      File.open(file, "r") { |f| data = f.read

        send_file file,
      :type => @candidate.attached_files.last.dumpfile_content_type,
      :file_name => @candidate.attached_files.last.dumpfile_file_name,
      :disposition => 'inline'
      }
    else
      @candidate = UnregisteredUser.find params[:id]
    end
  end

end

