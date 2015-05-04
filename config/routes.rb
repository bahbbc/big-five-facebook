Rails.application.routes.draw do

  root to: 'home#index', via: :get
  get 'auth/facebook', as: "auth_provider"
  get 'auth/facebook/callback', to: 'personality_questions#new'

  resources :personality_questions, only: [:index, :new, :create, :show]
end
