
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  Rails.application.routes.draw do
    get "up" => "rails/health#show", as: :rails_health_check

    devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

   devise_scope :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
  
   # Rutas de Devise para usuarios
   
    root 'home#index'  # Página de inicio
    
    get "home/index"  # Ruta para la acción index del HomeController
  
    # Rutas para CRUD de propiedades
    resources :properties  
  
    # Si deseas crear usuarios manualmente, puedes dejar esta ruta. Si no la necesitas, puedes eliminarla
    resources :users, only: [:create]  
    
  end