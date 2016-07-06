Rails.application.routes.draw do

  namespace :api do
    # get 'races', to: 'races#index'
    # get 'races/:id', to: 'races#show', as: 'race'
    get 'races/:race_id/results', to: 'results#index', as: 'race_results'
    get 'races/:race_id/results/:id', to: 'results#show', as: 'race_result'
    get 'racers', to: 'racers#index'
    get 'racers/:id', to: 'racers#show', as: 'racer'
    get 'racers/:racer_id/entries', to: 'entries#index', as: 'racer_entries'
    get 'racers/:racer_id/entries/:id', to: 'entries#show', as: 'racer_entry'

    resources :races
  end
  # namespace :api, defaults: {format: 'json'} do
  #   resources :races
  #   resources :races do
  #     resources :results
  #   end
  # end  

  # resources :racers
  # resources :races
  # resources :racers do
  #   post "entries" => "racers#create_entry"
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
