# frozen_string_literal: true

Rails.application.routes.draw do
  # BEGIN
  root 'homes#index'

  resources :posts do
    scope module: :posts do
      resources :comments, except: [:show]
    end
  end

  # END
end
