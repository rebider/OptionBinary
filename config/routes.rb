Rails.application.routes.draw do
devise_for :admins
devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
 scope "(:locale)", locale: /es|en/ do


  get 'statistics/index'

  resources :broker_accounts
  resources :azzets
  resources :trades
  resources :settings
  resources :dashboard
  resources :statistics
  #get 'ruteador/index'

  
  #get 'welcome/index'

  
  resources :strategies
  resources :account_balances
  resources :brokers
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'ruteador#index'
  get 'home' => 'welcome#index', as: :welcome

  post 'dashboard/:id/update_result' => 'dashboard#update_result', as: :update_result
  post 'dashboard/create' => 'dashboard#create', as: :create_dashboard

  get 'broker_accounts/:id/current_balance' => 'broker_accounts#current_balance', as: :current_balance

  get 'strategies/:id/total_trades' => 'strategies#total_trades', as: :strategies_total_trades
  get 'azzets/:id/total_trades' => 'azzets#total_trades', as: :azzets_total_trades

  get 'settings/user_settings' => 'settings#user_settings', as: :user_settings

  get 'statistics/index'
  #get 'statistics/today_scores' => 'statistics#today_scores', as: :today_scores

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
# match '*path', to: redirect("/#{I18n.default_locate}/%{path}") 
# match '',      to: redirect("/#{I18n.default_locate}") 
end
