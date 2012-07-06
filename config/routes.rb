Yaponama::Application.routes.draw do

  scope "/toyota/epc" do
    get 'pnc' => 'toyota_epc_pnc#index'
    post 'pnc' => 'toyota_epc_pnc#search', :as => :toyota_epc_search_pnc 
  end

  post 'robokassa/result' => 'robokassa#result'
  post 'robokassa/success' => 'robokassa#success'
  post 'robokassa/fail' => 'robokassa#fail'

  resources :links do
    member do
      match 'check'
    end
  end

  resources :callback_requests, :path_names => {:create => "asdf"} do
    collection do 
      match 'please'
      match 'call_me'
      match 'thanks'
      match 'sorrow'
    end
  end

  post 'parts_images' => 'parts_images#create'

  match 'pages/new/:path' => "pages#new", :as => 'new_predefined_page'
  resources :pages

  get 'robots.txt' => "robots_txt#index"

  match 'admin' => redirect('/blocks')
  resources :blocks, :only => ['edit', 'update', 'index']

  mount Ckeditor::Engine => '/ckeditor'

  # http://railsdog.com/blog/2010/10/29/redirect-non-www-requests-the-rails3-way/
  #constraints(:host => /^yaponama.ru/) do
  #  root :to => redirect("http://www.yaponama.ru")
  #  match '/*path', :to => redirect {|params| "http://www.yaponama.ru/#{params[:path]}"}
  #end
  
  require "socket"
  case Socket.gethostname
  when 'yaponama.ru'
    match '(/(*path))' => redirect{ |params| "http://www.yaponama.ru/#{params[:path].gsub(' ', '%20')}"}, :constraints => lambda { |req| !req.host.include?("www.yaponama.ru") && !req.host.include?("localhost") && !(req.host =~ /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/) }, :defaults => { :path => '' }
  when 'kaprika.ru'
    match '(/(*path))' => redirect{ |params| "http://kaprika.ru/#{params[:path].gsub(' ', '%20')}"}, :constraints => lambda { |req| req.subdomain != '' && !req.host.include?("localhost") && !(req.host =~ /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/) }, :defaults => { :path => '' }
  end

  resources :orders do
    get 'page/:page', :action => :index, :on => :collection
    member do
      match 'choose', :path => 'checkout/choose'
      match 'fill', :path => 'checkout/fill'
      match 'print', :path => 'checkout/print'
    end
  end

  get 'contacts' => "pages#render_page", :defaults => {:path => 'contacts'}
  get 'delivery' => "pages#render_page", :defaults => {:path => 'delivery'}
  get 'payment' => "pages#render_page", :defaults => {:path => 'payment'}
  
  post 'data' => 'data#index'

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
      post 'wishes' => "orders#create", :as => 'multiple_update_wishes_path', :via => 'put', :constraints => lambda { |req| req.env["rack.request.form_hash"]["commit"] =~ /Отправить на обработку/ }
      post 'wishes' => "orders#destroy", :as => 'multiple_update_wishes_path', :via => 'put', :constraints => lambda { |req| req.env["rack.request.form_hash"]["commit"] =~ /Отменить заказ и вернуть товары в корзину/ }      
    end
  end

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
    match '/users/become(/:id)' => 'sessions#become', :as => :become, :via => :get
    match '/users/show_become(/:id)' => 'sessions#show_become', :as => :show_become, :via => :get
  end

  devise_for :users, :controllers => {
          :confirmations => "confirmations",
          :registrations => "registrations",
          :passwords => "passwords",
          :sessions => "sessions"
  }

  resources :clients


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

  #match '/info/:catalog_number(-:manufacturer)' => "info#index", :catalog_number => /[^-]+/, :as => :info, :via => :get
  match '/info/:catalog_number(/:manufacturer)' => "info#index", :as => :info, :via => :get

  match "*path" => "pages#render_page", :constraints => PageConstraint.new

end
