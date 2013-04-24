class JobSeekersController < ApplicationController

  @@test = ''
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
    @job_post_id = params[:job_id].to_i

    if file && checkformat(file.original_filename)

      # tmp upload file
      upload_files(file)
      cleanup(@path)

      current_user.attached_files.create(:dumpfile => file)
      current_user.job_portals.create(:job_post_id => @job_post_id)
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

  def signup_second_step
    @id = params[:id].to_i
    @user_info = UserInfo.new()
    @countries = Country.all
    @states = State.all
  end

  def creating_user_info
    file = params[:user_info][:attachedfile]
    @id = params[:id].to_i
    @user = User.find_by_id(@id)
    if not params[:user_info][:attachedfile].nil?
      if file && checkformat(file.original_filename)
        #upload file temporarily
        upload_files(file)
        @user.attached_files.create(:dumpfile =>file)
      end
    end
    params[:user_info].delete :attachedfile
    @user_info = UserInfo.new(params[:user_info])
    @user_info.user_id = @id
    @user_info.country_id = params[:country][:country_id]
    @user_info.state_id = params[:state][:state_id]
    #@user.build_user_info(:country_id => params[:country][:country_id], :state_id => params[:state][:state_id])
    if @user_info.save
      @user.update_attributes(:signup_status => "step2")
      Devise::Mailer.confirmation_instructions(@user).deliver
      #UserMailer.activation_email(@user).deliver
      redirect_to jobseeker_dashboard_path
    else
      redirect_to :back
    end
  end

  

  def jobseeker_dashboard

  end

  def update_states
    @states = State.where(:country_id => params[:country_id])
    render :partial => "states", :object => @states
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
          @user.job_portals.create(:job_post_id => @job_post_id)
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