Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  get '/results', to: 'pages#results', as: :show_pages
  post '/connections/:id', to: 'connections#follow', as: :add_connection
  delete '/connections/:id', to: 'connections#unfollow', as: :remove_connection 
  get '/connections/requests', to: 'connections#requests', as: :requests_connections
  get '/dashboard', to: 'pages#dashboard', as: :dashboard_page
  get '/editprofile', to: 'users#editprofile', as: :edit_profile
  patch '/dashboard', to:'users#updateprofile', as: :update_profile
  get '/dashboard/networks', to: 'pages#networks', as: :networks_page
  get '/roadmaps/suggested', to: 'roadmaps#suggested', as: :suggested_roadmap
  get '/roadmaps/builder', to: 'roadmaps#builder', as: :builder_roadmap
  
  resources :roadmaps, only: [:create, :show] do 
    resources :comments, only: [:create]
  end
  get '/chat/:id', to: 'chats#chat', as: :chat
  post 'chat/:id', to: 'chats#sending'

  resources :users, only: [:index] do
    member do
      post :follow
      post :unfollow
    end
  end
end
