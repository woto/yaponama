Yaponama::Application.routes.draw do

  resources :orders

  get 'about' => "about#index"
  
  post 'screen_width' => "screen_width#index"

  resources :search_histories

  resources :wishes do
    collection do
      #post 'multiple_update' => "wishes#multiple_update", :constraints => lambda { |req| req.env["rack.request.form_hash"]["commit"] =~ /Пересчитать цену/ }
      #post 'multiple_update' => "wishes#multiple_delete", :constraints => lambda { |req| req.env["rack.request.form_hash"]["commit"] =~ /Удалить выделенные/ } 
      #post 'multiple_update' => "wishes#multiple_inactivate", :constraints => lambda { |req| req.env["rack.request.form_hash"]["commit"] =~ /Отложить выделенные/ }    
      #post 'multiple_update' => "wishes#multiple_activate", :constraints => lambda { |req| req.env["rack.request.form_hash"]["commit"] =~ /Вернуть выделенные в корзину/ }
              
      post 'wishes' => "wishes#multiple_update", :as => 'multiple_update', :via => 'put', :constraints => lambda { |req| req.env["rack.request.form_hash"]["commit"] =~ /Пересчитать цену/ }
      post 'wishes' => "wishes#multiple_delete", :as => 'multiple_update', :via => 'put', :constraints => lambda { |req| req.env["rack.request.form_hash"]["commit"] =~ /Удалить выделенные/ }
      post 'wishes' => "wishes#multiple_inactivate", :as => 'multiple_update', :via => 'put', :constraints => lambda { |req| req.env["rack.request.form_hash"]["commit"] =~ /Отложить выделенные/ }
      post 'wishes' => "wishes#multiple_activate", :as => 'multiple_update', :via => 'put', :constraints => lambda { |req| req.env["rack.request.form_hash"]["commit"] =~ /Вернуть выделенные в корзину/ }
    end
  end
  
  #post 'wishes' => "orders#create", :as => 'multiple_update_wishes_path', :via => 'put', :constraints => lambda { |req| req.env["rack.request.form_hash"]["commit"] =~ /Оформить заказ/ }
  #post 'wishes' => "orders#destroy", :as => 'multiple_update_wishes_path', :via => 'put', :constraints => lambda { |req| req.env["rack.request.form_hash"]["commit"] =~ /Отменить заказ и вернуть товары в корзину/ }
  

  resources :searches do 
    match '(/:catalog_number(/:manufacturer(/:replacements)))' => "searches#index", :on => :collection, :as => :search, :via => :get
    match '?skip' => "searches#index", :on => :collection, :as => :skip_search, :via => :get
  end

  resources :messages
  resources :requests
  resources :cars do
    resources :requests
  end

  as :user do
    match '/users/confirmation' => 'confirmations#update', :via => :put, :as => :update_confirmation
    match '/users/confirmation/insert' => 'confirmations#insert', :as => :insert_confirmation
    match '/users/confirmation' =>'confirmations#show', :via => :post, :as => :show_confirmation
    match '/users/variants' => "confirmations#variants", :as => :variants
  end

  devise_for :users, :controllers => {
          :confirmations => "confirmations",
          :registrations => "registrations",
          :passwords => "passwords"
  }
  #devise_for :users

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
  root :to => 'main#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
