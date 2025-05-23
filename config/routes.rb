Rails.application.routes.draw do
  resources :movies
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]

  root "lists#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
