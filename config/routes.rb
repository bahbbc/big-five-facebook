Rails.application.routes.draw do

  root to: 'auth#facebook', via: :get
  get 'auth/facebook', as: "auth_provider"
  get 'auth/facebook/callback', to: 'personality#new'

  resources :personality_questions, only: [:index, :new, :create, :show]
end
