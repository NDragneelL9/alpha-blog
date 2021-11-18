Rails.application.routes.draw do
  root "pages#home"
  get 'about', to: "pages#about"
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]
end
