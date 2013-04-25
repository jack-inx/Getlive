class HomeController < ApplicationController
  def index

  end

  def about_us

  end

  def rec_index
    render :layout => 'recruiter'
  end

  def search_resume
    @users = User.all
    @unregistered = UnregisteredUser.all
    @resumes = @users + @unregistered
    render :layout => 'recruiter'
  end

end

