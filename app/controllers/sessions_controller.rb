class SessionsController < Devise::SessionsController

  #  def destroy
  #    session[:user_id] = nil
  #    sleep 3
  #    redirect_to root_url
  #  end
  def create
    p params[:user][:email]
    #exit
    @user = User.find_by_email(params[:user][:email].downcase)
    if params[:user][:email] == "" or params[:user][:password] == ""
      respond_to do |format|
        flash[:notice] = "Email or Password should not be empty."
        format.html{redirect_to :back}
      end
    elsif @user.nil?
      respond_to do |format|
        flash[:notice] = "User #{params[:user][:email].downcase} failed signin, user cannot be found."
        format.html{redirect_to :back}
      end
    elsif not @user.confirmation_token.nil?
      respond_to do |format|
        flash[:notice] = "Please confirm your email id before sign in."
        format.html { redirect_to :back }
      end
    elsif not @user.valid_password?(params[:user][:password])
      #logger.info("User #{email} failed signin, password \"#{password}\" is invalid")
      respond_to do |format|
        flash[:notice] = "Invalid password."
        format.html { redirect_to :back }
      end
    elsif @user.signup_status == "step1"
      respond_to do |format|
        flash[:notice] = "Please enter the basic details."
        format.html { redirect_to signup_second_step_path(@user.id) }
      end
    else
      resource = warden.authenticate!(auth_options)
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with resource, :location => after_sign_in_path_for(resource)
    end
  end
end
