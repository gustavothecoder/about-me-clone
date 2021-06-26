# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  resources :users, only: %i[new create]

  scope '/users' do
    get '/:username', to: 'users#show'
  end

  get '/examples', to: 'users#examples'
  post '/next_signup_step/:step', to: 'users#next_signup_step'
end
