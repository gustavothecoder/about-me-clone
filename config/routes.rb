# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#homepage'

  get '/signup', to: 'users#new'
  post '/next_signup_step/:step', to: 'users#next_signup_step'
end
