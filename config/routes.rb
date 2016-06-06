Rails.application.routes.draw do
  # devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  devise_for :admins
  devise_for :students


  namespace :admin do
    devise_scope :admin do
      root 'dashboards#index'
      resource :dashboard, only: :index
      resource :students
      post '/students' => 'students#show'
      post '/search_students' => 'students#show'

      get 'analysis/new/:student_id' => 'analyses#new'
      post 'perform_analysis' => 'analyses#perform_analysis'
      # resource :analysis
    end
  end

  namespace :students do
    devise_scope :students do
      root 'dashboards#index'
      resource :dashboard, only: :index

    end
  end

  # , controllers: {
  #   sessions: 'student/sessions',
  #   registrations: 'student/registrations',
  #   passwords: 'student/passwords',
  #   invitations: 'student/invitations'
  # }

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
