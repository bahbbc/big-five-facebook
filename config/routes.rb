Rails.application.routes.draw do
  root to: "home#index"

  resources :personality_questions, only: [:index, :new, :create]
end
