class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource)
    if not current_admin_user.nil?
      #if params[:controller] == "devise/sessions"
      return admin_dashboard_path
    elsif not current_recruiter.nil?
      return rec_index_path(current_user)
    elsif not current_user.nil?
      #return all_jobs_path
      return jobseeker_dashboard_path
    #end
    #@current_user = User.find(current_user)
    #    if resource.signup_status == "step2"
    #      return social_detail_path(current_user)
    #    elsif resource.signup_status == "step1"
    #      return user_details_path
    #    elsif resource.signup_status == "step3"
    #      return user_profile_path(current_user)
    #    else
    #      return user_details_path
    #    end
    end
  end

end