# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  resources :users, only: %i[create]
  get '/examples', to: 'users#examples'
  get '/:username', to: 'users#show'

  namespace :users do
    resources :registrations, only: %i[new create]
  end
end
