Rails.application.routes.draw do
  root to: "personality_questions#new"

  resources :personality_questions, only: [:index, :new, :create, :show]
end
