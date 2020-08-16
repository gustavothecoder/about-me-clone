# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#homepage'

  resources :users, only: %i[new]
end
