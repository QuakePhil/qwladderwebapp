Rails.application.routes.draw do
  root "application#index"
  #resources :users

  #resources :pings

  #resources :servers

  #resources :ladders
  
  #source: https://www.airpair.com/ruby-on-rails/posts/building-a-restful-api-in-a-rails-application
  
  scope '/api' do
    scope '/v1' do
      scope '/serverlist' do
        get '/' => 'api_servers#index'
        post '/' => 'api_servers#create'
        scope '/:name' do
          get '/' => 'api_projects#show'
          put '/' => 'api_projects#update'
          scope '/todos' do
            get '/' => 'api_todos#index'
            post '/' => 'api_todos#create'
            scope '/:todo_name' do
              get '/' => 'api_todos#show'
              put '/' => 'api_todos#update'
            end
          end
        end
      end
    end
  end

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
