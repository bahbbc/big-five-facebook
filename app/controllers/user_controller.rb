class UserController < ApplicationController

  def index;end

  def login
    @user = User.koala(request.env['omniauth.auth']['credentials'])
    # redirect_to new_personality_question_url
  end
end
