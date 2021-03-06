Rails.application.routes.draw do


  get 'users/show' => 'users#show'
  
  resources :payments
  resources :categories
  resources :groups

  root 'static_pages#home'
  get "/help" => 'static_pages#help'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
