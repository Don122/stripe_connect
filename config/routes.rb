Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :users do
    member do
      post :pay
      post :subscribe
    end
  end

  resource :sessions do
    member do
      get :destroy, as: 'destroy'
    end
  end

  # Stripe Connect endpoints
  #  - oauth flow
  get '/connect/oauth' => 'stripe#oauth', as: 'stripe_oauth'
  get '/connect/confirm' => 'stripe#confirm', as: 'stripe_confirm'
  get '/connect/deauthorize' => 'stripe#deauthorize', as: 'stripe_deauthorize'
  #  - create accounts
  post '/connect/managed' => 'stripe#managed', as: 'stripe_managed'
  post '/connect/standalone' => 'stripe#standalone', as: 'stripe_standalone'

  # Stripe webhooks
  post '/hooks/stripe' => 'hooks#stripe'
end
