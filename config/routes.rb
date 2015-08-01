Rails.application.routes.draw do
  root to: 'home#index', via: :get
  get 'auth/facebook', as: 'auth_provider'
  get 'auth/facebook/callback', to: 'sessions#create'

  get 'user_police', to: 'home#user_police', as: 'user_police'

  resources :personality_questions, only: [:index, :new, :create, :show]
end
