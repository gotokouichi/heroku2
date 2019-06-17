Rails.application.routes.draw do
  get 'sessions/new'
  get 'member_users/new'
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get "/member_users" => "member_users#new"
  resources :member_users
 
  
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'  
  delete '/logout', to: 'sessions#destroy'
end
