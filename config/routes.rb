Getlive::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :recruiters do |f|
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
    get "/signup" => "registrations#new"
  end

  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions" } do |f|
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
    #get "/signup" => "devise/registrations#new"
    match "/creating_jobseeker" => "registrations#creating_jobseeker", :as => :creating_jobseeker
  end

  match "/auth/:provider/callback" => "authorizations#create"

  match "/list_of_applied"                        => "job_posts#show_applied_candidate"
  match "/recruiter/home"                         => "home#rec_index", :as => :rec_index
  match "/search/resume"                          => "home#search_resume", :as => :search_resume
  match "/aboutus"                                => "home#about_us", :as => :about_us
  match "/post/job"                               => "job_posts#job_post", :as => :job_post
  match "/candidates/:id"                         => "job_posts#show_applied_candidate"
  match "/edit_job_post/:id"                      => "job_posts#edit_job_post"
  put "/update_job_post"                          => "job_posts#update_job_post"
  delete "/delete_job_post/:id"                   => "job_posts#delete_job_post"
  match   "/profile/:id"                          => "job_posts#show_profile"
  match "update_profile"                            => "job_posts#update_profile"

  resources :job_posts, :only =>[:update], :as    => :recruiter_path
  #match "/update_profile"                         => "job_posts#update_profile"

  match "/candidate_details/:type/:id" => 'job_posts#candidate_details'

  match "/create/job" => "job_posts#create_job", :as => :create_job
  match 'my_post' => 'job_posts#my_post'
  match "/jobs" => "job_posts#show_jobs", :as => :show_jobs #posted by recruiters
  match "/all_jobs" => "job_seekers#all_jobs", :as => :all_jobs
  match "/job_detail/:id" => "job_seekers#job_description"
  match "/apply_for_job/:id" => "job_seekers#apply_for_job", :as => :apply_for_job
  match "/upload" => "job_seekers#upload_file"
  match "/apply_without_signup/:id" => "job_seekers#apply_without_signup", :as => :apply_without_signup
  match "/create_unregistered_user" => "job_seekers#create_unregistered_user", :as => :create_user_record
  match "/signup/second_step/:id" => "job_seekers#signup_second_step", :as => :signup_second_step
  match "/creating_user_info" => "job_seekers#creating_user_info", :as => :creating_user_info
  match "/update_states" => "job_seekers#update_states"
  match "/jobseeker/dashboard" => "job_seekers#jobseeker_dashboard", :as => :jobseeker_dashboard

  #match "/creating_jobseeker" => "job_seekers#creating_jobseeker", :as => :creating_jobseeker
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
# match ':controller(/:action(/:id(.:format)))'
end
