Rails.application.routes.draw do
  resources :users
  resources :users_sessions
  resources :stores  
  resources :branches, :controller => 'branch' ,:path => 'branch'
  resources :tests

  get 'login' => 'user_sessions#new'
  post 'login' => 'user_sessions#create'
  get "logout" => "user_sessions#destroy"
  delete "logout" => "user_sessions#destroy"


  ######### for store  
  get 'store/new' => 'store#new' #view
  post 'store/new' => 'store#create' #submit [post]  
  patch 'store/update' => 'store#update'  


  ######### for branch/dashboard
  get 'store/dashboard' => 'branch#index' #view
  get 'store/branch/new' => 'branch#new' #view
  get 'store/settings' => 'branch#settings' #view
  
  #delete  'sites/:site_id/pic_destroy' => 'sites#pic_destroy'
  
  root 'welcome#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
