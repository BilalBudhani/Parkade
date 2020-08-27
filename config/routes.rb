Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


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
