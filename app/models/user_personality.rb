class UserPersonality < ActiveRecord::Base

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.token = auth.credentials.token
      user.link = auth.extra.raw_info.link
      user.location = auth.info.location
      user.expires_at = Time.at(auth.credentials.expires_at)
      user.nickname = auth.info.nickname
      user.gender = auth.extra.raw_info.gender
      user.save!
    end
  end

  def self.koala(access_token)
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,email")
  end
end
