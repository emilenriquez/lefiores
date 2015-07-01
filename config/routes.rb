Rails.application.routes.draw do
  resources :users
  resources :users_sessions
  #resources :stores  
  resources :stores
  resources :branches, :controller => 'branch' ,:path => 'branch'
  resources :tests

  ##### api
  post 'api/search_locations_by_zipcode'

  ######### oururls
  get 'delivery' => 'welcome#delivery'
  get 'payment' => 'welcome#payment'
  get 'the-lefiores-team' => 'welcome#the_team'
  get 'substitution' => 'welcome#substitution'
  get 'customer-service' => 'welcome#customer_service'
  get 'sitemap' => 'welcome#sitemap'
  get 'contact-us' => 'welcome#contact_us'
  get 'copyrights' => 'welcome#copyrights'  
  get 'privacy-disclaimers' => 'welcome#privacy_disclaimers'


  get 'login' => 'user_sessions#new'
  post 'login' => 'user_sessions#create'
  get "logout" => "user_sessions#destroy"
  delete "logout" => "user_sessions#destroy"

  
  get 'register' => 'users#new' 
  post 'register' => 'users#create'

  ######### for store  
  get 'store/new' => 'store#new' #view
  post 'store/create' => 'store#create' #submit [post]  
  patch 'store/update' => 'store#update'  

  ######### for store  
  get '/florist/:store_slug' => 'store#show_store' #view
  get 'store/:store_id/catalog' => 'products#index' #view
  get 'store/:store_id/catalog/new' => 'products#new' #view
  post 'store/create' => 'store#create' #submit [post]  
  patch 'store/update' => 'store#update'  


  ######### for branch setup
  get 'store/branch/:id/edit_delivery_areas' => 'branch#edit_delivery_areas'
  patch 'store/branch/:branch_id/update_delivery_areas' => 'branch#update_delivery_areas'
  post 'store/branch/:branch_id/update_delivery_areas' => 'branch#update_delivery_areas'
  post 'branch/create' => 'branch#create' #submit [post]  
  post 'branch/update_delivery_areas' => 'branch#update_delivery_areas' #submit [post]  
  post 'branch/update' => 'branch#update' #submit [post]  
  #get 'branch/:id/edit' => 'branch#edit'
  #post 'branch/:site_id/update' => 'sites#update'
  #patch 'sites/:site_id/update' => 'sites#update'


  ######### for branch/dashboard
  get 'store/dashboard' => 'branch#index' #view
  get 'store/branch/new' => 'branch#new' #view
  get 'store/:branch_id/settings' => 'store#settings'
  get 'store/:branch_id/edit' => 'branch#edit'
  post 'store/settings/:store_id/upload_photo' => 'store#image_create'
  get 'store/:store_id/settings/set_logo/:image_id' => 'store#set_logo'
  


  get 'store/settings' => 'branch#settings' #view
  
  #delete  'sites/:site_id/pic_destroy' => 'sites#pic_destroy'

  ######### for products
  post 'store/:store_id/catalog/create' => 'products#create' #view
  get 'store/:store_id/catalog/set_product_image/:image_id' => 'products#set_image'
  post 'store/:store_id/catalog/upload_photo' => 'products#image_create'
  delete 'store/:store_id/catalog/:product_id/destroy' => 'products#destroy'
  get 'store/:store_id/catalog/:product_id/edit' => 'products#edit'
  patch 'store/:store_id/catalog/:product_id/update' => 'products#update'
  patch 'store/:store_id/catalog/:product_id/deactivate' => 'products#deactivate'
  
  root 'welcome#index'
  post 'search/' => 'welcome#search' #view
  ######## for users
  #search flower shops by zipcode

  #namespace :store do#
  #
  #end
  get '/product/:id/show' => 'store/products#show'

  namespace :admin do
    root 'welcome#index'
    resources :locations do
      collection { post :import }
    end

    ######## users
    get 'users' => 'users#index'
    get 'dashboard' => 'welcome#index'
    get 'users/:id' => 'users#show'
    get 'users/:id/edit' => 'users#edit'
    patch 'users/:id/update' => 'users#update'

    #location
    get 'locations' => 'locations#index'
    get 'locations/new' => 'locations#new'
    post 'locations/create' => 'locations#create'    


    get 'cities' => 'cities#index'
    get 'cities/new' => 'cities#new'
    patch 'cities/:id/update' => 'cities#update'
    post 'cities/new' => 'cities#create'    

    #admin/state
    get 'states' => 'states#index'
    get 'states/new' => 'states#new'
    patch 'states/:id/update' => 'states#update'
    post 'states/new' => 'states#create'  

    #admin/caegories
    get 'categories' => 'categories#index'
    get 'categories/new' => 'categories#new'
    get 'categories/:category_id/edit' => 'categories#edit'
    post 'categories/create' => 'categories#create'
    patch 'categories/update' => 'categories#update'

  end  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
