Rails.application.routes.draw do
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  Rails.application.routes.draw do
  get "home/index"
    root 'home#index'  # Página de inicio
    get 'login', to: 'sessions#new'  # Vista de login
    post 'login', to: 'sessions#create'  # Acción de login
    delete 'logout', to: 'sessions#destroy'  # Acción de logout
    resources :properties  # CRUD de propiedades
    get 'signup', to: 'users#new'  # Registro de usuario
    resources :users, only: [:create]  # Acción de crear usuario
  end
  
end
