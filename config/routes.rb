Rails.application.routes.draw do
  get 'group_users/new'
  get 'sessions/new'
  get 'member_users/new'
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/help'
  get "/users" => "users#new"
  
  resources :users
  resources :member_users
  resources :group_users
  
  get '/member_or_group', to: 'users#member_or_group'
  post '/member_or_group', to: 'users#create'
  
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'  
  delete '/logout', to: 'sessions#destroy'
end
