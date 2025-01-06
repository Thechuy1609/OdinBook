Rails.application.routes.draw do
  resources :chats
 root "posts#home"
 get 'users/:id/profile', to: 'users#profile', as: 'user_profile'
  devise_for :users, controllers: {
    registrations: 'users/registrations' ,
    sessions: 'users/sessions' ,
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users do
    post 'follow',   to: 'socializations#follow'
    post 'unfollow', to: 'socializations#unfollow'
    post 'like', to: 'socializations#like'
    delete 'unlike', to: 'socializations#unlike'
  end
  
  resources :profile

  resources :posts do
    member do
      post 'like', to: 'socializations#like'
      delete 'unlike', to: 'socializations#unlike' 
    end
    resources :comments, only: [:create, :destroy]
  end
resources :chats do
  resources :messages
end
match '*path' => redirect('/'), via: :get
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
