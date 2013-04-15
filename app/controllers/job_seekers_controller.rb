class JobSeekersController < ApplicationController
  def all_jobs
    @all_jobs = JobPost.all
  end

  def apply_for_job
    @job = JobPost.find params[:id]
    @job_post_id = params[:id].to_i
    if not current_user
      flash[:notice] = "Please provide the following details to apply for a job"
      redirect_to apply_without_signup_path(@job_post_id)
    end
  end

  def upload_file
    file = params[:file]

    if file && checkformat(file.original_filename)
      
      # tmp upload file
      upload_files(file)
      #cleanup(@path)
      
      current_user.attached_files.create(:dumpfile => file)
      flash[:notice] = "You can apply more jobs"
      redirect_to all_jobs_path

    else
      flash[:notice] = "Please use .doc, .docx or .pdf format only"
      redirect_to :back
    end
  end

  def apply_without_signup
    @job_post_id = params[:id].to_i
    @user = UnregisteredUser.new
  end

  def create_unregistered_user
    file = params[:unregistered_user][:attachedfile]
    if !params[:unregistered_user][:email].empty?

      if file && checkformat(file.original_filename)
        # tmp upload file
        upload_files(file)

        @job_post_id = params[:id].to_i
        @recruiter = JobPost.find_by_id(@job_post_id).recruiter
        @user = UnregisteredUser.new(params[:unregistered_user])
        @existing_user = UnregisteredUser.find_by_email(params[:unregistered_user][:email])
        if @existing_user
          respond_to do |format|
            UserMailer.job_application_mail(@existing_user,@recruiter, @path, @name).deliver
            #delete the file after sending mail
            cleanup(@path)

            flash[:notice] = "User already exists."
            format.html { redirect_to root_path }
          end
        elsif @user.save!(:validate => false)
          @user.attached_files.create(:dumpfile =>file)

          flash[:notice] = "User created and you have successfully applied for this job."
          redirect_to all_jobs_path
        else
          redirect_to :back
        end
      else
        flash[:notice] = "Please use .doc, .docx or .pdf format and required fields."
        redirect_to :back
      end
    else
      flash[:notice] = "Please enter email id."
      redirect_to :back
    end
  end

  private

  def upload_files(file)
    # uploding file
    @name = Random.rand(Time.now.to_i).to_s
    @name += sanitize_filename(file.original_filename)
    @directory = "public/data"
    # create the file path
    @path = File.join(@directory, @name)
    # write the file

    File.open(@path, "wb") { |f| f.write(file.read) }

  end

  def sanitize_filename(file_name)
    # get only the filename, not the whole path (from IE)
    just_filename = File.basename(file_name)
    # replace all none alphanumeric, underscore or perioids
    # with underscore
    just_filename.sub(/[^\w\.\-]/,'_')
  end

  def cleanup(file_path)
    File.delete(file_path) if File.exist?(file_path)
  end

  def checkformat(file)
    fileFormat = ['doc','docx','pdf']
    fileFormat.include?(file.split('.')[1])
  end
end