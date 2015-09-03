Rails.application.routes.draw do
  root to: 'home#index', via: :get
  get 'auth/facebook', as: 'auth_provider'
  get 'auth/facebook/callback', to: 'sessions#create'

  get 'user_policy', to: 'home#user_policy', as: 'user_policy'
  get 'research_terms', to: 'home#research_terms', as: 'research_terms'
  get 'missing_permission', to: 'personality_questions#missing_permission', as: 'missing_permission'

  resources :personality_questions, only: [:index, :new, :create, :show]
end
