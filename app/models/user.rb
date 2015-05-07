class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    first_or_initialize.tap do |user|
      user.name = auth['info']['name'],
      user.email = auth['info']['email'],
      user.token = auth['credentials']['token'],
      user.link = auth['extra']['raw_info']['link'],
      user.location = auth['info']['location'],
      user.expires_at = Time.at(auth['credentials']['expires_at']),
      user.nickname = auth['info']['nickname'],
      user.gender = auth['extra']['raw_info']['gender'],
      user.save!
    end
  end
end
