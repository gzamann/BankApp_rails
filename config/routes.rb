# frozen_string_literal: true

Rails.application.routes.draw do
  resources :branches
  resources :clients
  resources :accounts
  resources :transactions
  resources :cards
  resources :loans
end
