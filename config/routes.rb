Rails.application.routes.draw do
  match '/emails', to: 'emails#new', via: 'get'
  match '/emails', to: 'emails#create', via: 'post'
  match '/cancel', to: 'emails#edit', via: 'get'
  match '/cancel', to: 'emails#update', via: 'post'
  match '/confirm', to: 'emails#confirm', via: 'get'
  match '/thankyou', to: 'emails#thankyou', via: 'get'
  match '/error', to: 'emails#no_authorization', via: 'get'
  
  match '/start', to: 'survey_users#start', via: 'get'
  match '/start', to: 'survey_users#director', via: 'post'
  
  match '/survey_users/new', to: 'survey_users#create', via: 'post'
  match '/surveys/new', to: 'surveys#create', via: 'post'
  resources :survey_users
  resources :surveys

  
  
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
