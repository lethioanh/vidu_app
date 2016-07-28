Rails.application.routes.draw do
# get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "application#hello"
  root 'static_pages#home'
  # get 'static_pages/home' chuyen thanh
  get '/home', to: 'static_pages#home'

  # get 'static_pages/help' chuyen thanh
  get '/help', to: 'static_pages#help'

  # get 'static_pages/about' chuyen thanh
  get '/about', to: 'static_pages#about'

  # get 'static_pages/contact' chuyen thanh
  get '/contact', to: 'static_pages#contact'

  # get new users = sign up of users
  get '/signup', to: 'users#new'
 get '/login', to: 'sessions#new'
 post '/login', to: 'sessions#create'
 delete '/logout', to: 'sessions#destroy'
  resources :users
end
