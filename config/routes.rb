Rails.application.routes.draw do

  root 'pages#home'
  get '/home' => 'pages#home'
  get '/test' => 'pages#test'

  resources :recipes do
    member do
      post 'like'
      resources :reviews, only: [:create, :update, :destroy]
    end
  end
  
  resources :chefs, except: [:new]
  get '/register' => 'chefs#new'

  get '/login' => 'logins#new'
  post '/login' => 'logins#create'
  get '/logout' => 'logins#destroy'

  resources :styles, only: [:new, :create, :show, :index]
  resources :ingredients, only: [:new, :create, :show, :index]
  
end
