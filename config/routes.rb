Markholton::Application.routes.draw do
  
  # map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  #   map.login '/login', :controller => 'sessions', :action => 'new'
  #   map.register '/register', :controller => 'users', :action => 'create'
  #   map.signup '/signup', :controller => 'users', :action => 'new'
  #   
  # map.resources :users, :collection => {:link_user_accounts => :get}
  #resources  :session
  resources :articles
  
  resources :posts do
    resources :comments
  end
  match 'grab_next' => 'posts#grab_next_n'
  
  resources :newspapers do
    resources :articles
  end
  
  resources :portfolios
  resources :codes
  
  #get 'home/index' #, :controller => 'home', :action => 'index'
  match 'about'   => 'about#index'
  
  devise_for :users
  
  #map.resource :about
  
  #map.signup '/signup', :controller => 'users', :action => 'new'
  #map.login  '/login',  :controller => 'sessions', :action => 'new'
  #map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  #   
  #map.root :home
  
  #devise_for :users
  
  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
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
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  
end
