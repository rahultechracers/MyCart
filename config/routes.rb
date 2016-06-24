Rails.application.routes.draw do

  get "log_out" => "session#destroy", :as => "log_out"
  
  get "log_in" => "session#new", :as => "log_in"
  
  get "sign_up" => "users#new", :as => "sign_up"
  
  get "cart"   => "carts#show"  ,:as =>"cart" 
  
  get 'cart_details/index'

  delete 'cart_details' => 'cart_details#destroy' ,:as=>'delete_cart_details'
  post 'cart_details'=> 'cart_details#create'
  get 'cart_details/edit'=>  'cart_details#edit', :as =>"edit_cart_details"
  put 'cart_details/update/:id'=>  'cart_details#update', :as =>"update_cart_details"
  
  root 'products#index'
  get 'order_details/order_id' => 'order_details#show', :as =>"show_order_details" 
  resources :order_details, only: [:index]
  resources :orders, only: [ :create, :new, :show, :index ]
  resources :session
  resources :users
  resources :products
  resources :transaction_details
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
