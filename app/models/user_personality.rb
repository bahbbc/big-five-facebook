class UserPersonality < ActiveRecord::Base

  def self.koala(access_token)
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,email")
  end
end
