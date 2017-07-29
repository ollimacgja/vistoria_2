Rails.application.routes.draw do

  resources :destinos
  resources :contact_groups
  namespace :api do
    namespace :v1 do
      resources :login, only: [:index, :create]
      resources :formulario, only: [:index, :create, :update]
    end
  end

  resources :usuarios
  resources :filials
  resources :logos, only: [:index, :update]
  devise_for :users
  get "formulario_fields/:id/new" => "formulario_fields#new"
  resources :formulario_fields
  get "formularios/:id/detalhe" => "formularios#detalhe"
  get "formularios/:id/respostas" => "formularios#answers", as: 'answers'

  get "check/:id" => "formularios#checks"

  get "formulario_preenchido/:id/form_enviado" => "formularios#form_enviado"
  get "formulario_preenchido/indexp" =>"formularios#indexp"

  resources :field_types
  #root "home#index"
  root "formularios#form_enviado"
  resources :formularios


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
