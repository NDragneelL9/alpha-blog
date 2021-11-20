Rails.application.routes.draw do
  root "pages#home"
  get 'about', to: "pages#about"
  resources :articles
  resources :categories
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
