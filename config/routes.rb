Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#root'
  post '/webhooks/:source', to: 'webhooks#create'  
  
  resource :dashboard
  resources :accounts
  resources :payouts, only: [:create]
  resources :products do
    resources :attachments, shallow: true
  end
  resource :checkout
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
end
