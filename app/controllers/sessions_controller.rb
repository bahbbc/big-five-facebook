class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_token] = user.token
    redirect_to new_personality_question_url
  end
end
