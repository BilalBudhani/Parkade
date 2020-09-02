# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
require_relative '../lib/domain_restrictor'

Rails.application.routes.draw do

  constraints DomainRestrictor.new  do

    namespace :admin do
      resources :users
      resources :domains

      root to: "users#index"
    end

    devise_for :users

    resources :domains do
      member do
        get :setup
        get :verify
      end
    end

    get :dash, to: "pages#index", as: :dashboard
    get :login, to: "pages#backdoor"
    get :gatekeeper, to: "domains#gatekeeper"
    root "pages#index"
  end

  constraints DomainRestrictor.new(false)  do
    get "/", to: "parking_lot#show"
    post "/", to: "parking_lot#offer", as: :offer
  end
end
