class AuthorizationsController < ApplicationController
  
  def create
    @auth_hash = request.env['omniauth.auth']
    #exit
    # render :text => auth_hash.inspect
    @user = User.find_by_email(@auth_hash['info']['email'])
    #auth_hash = request.env['omniauth.auth']
    @authorization = Authorization.find_by_provider_and_uid(@auth_hash["provider"], @auth_hash["uid"])
    if @authorization
      flash[:notice] = "Signed in with #{@auth_hash['provider']} Successfully"
      respond_to do |format|
        format.html{
          flash[:notice] = "Signed in successfully through #{@auth_hash['provider']}."
          sign_in_and_redirect(:user, @authorization.user)
        }
      end
    elsif @user
      @user.authorizations.build(:provider => @auth_hash['provider'], :uid => @auth_hash['uid'])
      @user.save(:validate => false)
      sign_in(@user)
      flash[:notice] = "Signed in successfully through #{@auth_hash['provider']}."
      redirect_to all_jobs_path
    else
      @user = User.new(:first_name => @auth_hash['info']['name'], :email => @auth_hash["info"]["email"])
      @user.authorizations.build(:provider => @auth_hash["provider"], :uid => @auth_hash["uid"])
      #@user.signup_status = "step2"
      if @user.save(:validate => false)
        @user.skip_confirmation!
        sign_in(@user)
        @user.update_attribute(:confirmation_token, nil)
        @user.update_attribute(:confirmed_at, Time.now)
        respond_to do |format|
          format.html { redirect_to all_jobs_path }
        end
      else
        respond_to do |format|
          format.html { redirect_to root_path }
        end
      end
    end
  end
end
