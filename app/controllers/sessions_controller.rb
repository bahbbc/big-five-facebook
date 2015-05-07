class SessionsController < ApplicationController
  def create
    user = UserPersonality.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to new_personality_question
  end
end
