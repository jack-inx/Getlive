Getlive::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :recruiters, :controllers => {:registrations => "registrations"} do |f|
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
    get "/signup" => "registrations#new"
  end

  devise_for :users, :controllers => {:registrations => "registrations"} do |f|
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
    get "/signup" => "registrations#new"
  end

  match "/auth/:provider/callback" => "authorizations#create"


  match "/recruiter/home" => "home#rec_index", :as => :rec_index
  match "/search/resume" => "home#search_resume", :as => :search_resume
  match "/aboutus" => "home#about_us", :as => :about_us
  match "/post/job" => "job_posts#job_post", :as => :job_post
  match "/create/job" => "job_posts#create_job", :as => :create_job
  match "/jobs" => "job_posts#show_jobs", :as => :show_jobs #posted by recruiters
  match "/all_jobs" => "job_seekers#all_jobs", :as => :all_jobs
  match "/apply_for_job/:id" => "job_seekers#apply_for_job", :as => :apply_for_job
  match "/upload" => "job_seekers#upload_file"
  match "/apply_without_signup/:id" => "job_seekers#apply_without_signup", :as => :apply_without_signup
  match "/create_unregistered_user" => "job_seekers#create_unregistered_user", :as => :create_user_record
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
