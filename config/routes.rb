Spearmint::Application.routes.draw do

  root to: "sessions#new"

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show] do
    resources :companies, only: [:new, :create]
  end

  resources :companies, only: [:edit, :update, :destroy] do
    resources :cash_accounts, only: [:create]
    resources :credit_accounts, only: [:create]
    resources :loan_accounts, only: [:create]
  end

  resources :cash_accounts, only: [:destroy]
  resources :credit_accounts, only: [:destroy]
  resources :loan_accounts, only: [:destroy]

  resources :transactions, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :budgets, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :goals, only: [:index, :new, :create, :edit, :update, :destroy]

  match '/activate_account', to: "users#activate_account", via: "get" #get?


  # namespace :api, defaults: { format: :json } do
  #   resources :transactions
  # end

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
