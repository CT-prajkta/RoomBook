Rails.application.routes.draw do
  resources :events
  #get 'welcome/home', to: 'welcome#home'
  root 'welcome#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'user#new'
  resources :events
  #patch 'room/edit', to: 'room#update'
  resources :user
  resources :meet, :room
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
