# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#index'
  devise_for :users

  # back stage
  namespace :admin do
    resources :courses do
    end
    resources :orders, only: [:index] do 
    end
  end

  # front stage
  resources :courses, only: %i[index show] do
    resources :orders, only: %i[new create] do
    end
  end

  resources :orders, only: [:index, :show] do
  end

end
