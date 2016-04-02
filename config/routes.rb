Rails.application.routes.draw do
  resources :enquiries
get 'admin', to: 'pages#admin'
  get 'contact', to: 'pages#contact'
  get 'about', to: 'pages#about'

  resources :profiles
  resources :photos
  resources :posts
  resources :events
  resources :groups do
        collection { post :import }
    end
 delete 'delete_all_groups', to: 'groups#delete_all'
        
  resources :group_categories
  devise_for :users
    
  get 'home/index'
    
#    for making someone an admin
  get 'make_admin/:id', to: 'users#make_admin'
    get 'remove_admin/:id', to: 'users#remove_admin'
        
#    Must appear BELOW the devise_for users code
    resources :users, only: :destroy

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
    root 'groups#index'

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
