# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'courses#index'
  devise_for :users
  # back stage
  namespace :owner do
    resources :courses, except: [:show] do
    end
    resources :orders, only: [:index] do 
    end
  end

  # front stage
  resources :courses, only: %i[index show]do
    resources :orders, only: [:new, :create] do
    end
  end

  resources :orders, only: [:index] do
  end

end
