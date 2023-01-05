require 'constraints/domain_constraint'
Rails.application.routes.draw do

  devise_for :users

  post '/webhooks/:source', to: 'webhooks#create'  
  # post '/pay/webhooks/stripe', to: 'webhooks#create'  

  constraints DomainConstraint do
    scope module: :stores do
      resources :products
      root to: 'products#index', as: 'store_root'
      resource :checkout, as: 'store_checkout'
      resources :logins
      resources :orders
      resources :attachments
    end    
  end  
  root 'static_pages#root'  
  resource :dashboard
  resources :accounts
  resources :payouts, only: [:create]
  resources :products do
    # shallow true is so attachements are nested under products
    # but attachments themselves are attachements/:id
    # so theyre not products/:id/attachemtns/:id
    resources :attachments, shallow: true
  end
  resource :store
  resource :checkout
  resources :customers
  resources :cardholders do
    resources :cards, shallow: true do
      resource :ephemeral_key, only: [:show]
    end
  end
end
