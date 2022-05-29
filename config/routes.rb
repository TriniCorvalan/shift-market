Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  devise_for :users
  get 'home/index'
  resources :shifts, except: %i[new create] do
    resources :auctions, only: %i[new edit]
  end

  resources :auctions, only: %i[index show update create] do
    resources :bids, only: %i[new edit]
  end

  resources :bids, only: %i[index create update]
end
