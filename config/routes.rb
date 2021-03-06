TwogsApp::Application.routes.draw do
  resources :assignments, :notes, :documents
  resources :timesheets do
    resources :workdays
    collection do
      get :current
      put :delete
    end
  end
  
  resources :attachments
    
  resources :jobs do
    collection do
      put :delete
    end
  end
  
  resources :users do
    collection do
      put :delete
    end
  end
  
  resources :employees do
    collection do
      put :delete
    end
  end
  
  resources :machine_metas do
    collection do
      put :delete
    end
  end
  
  resources :machines do
    collection do
      put :delete
      put :clear_task_history
    end
    
    resources :tasks do
      put :complete, :on => :member
      put :active, :on => :member
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  
  root 'static_pages#home'
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy',  via: 'delete'
  match '/time',    to: 'static_pages#time', via: 'get'
  
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
