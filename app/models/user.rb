class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    first_or_initialize.tap do |user|
      user.link = auth['extra']['raw_info']['link'],
      user.token = auth['credentials']['token'],
      user.location = auth['info']['location'],
      user.gender = auth['extra']['raw_info']['gender'],
      user.name = auth['info']['first_name'],
      user.nickname = auth['info']['name'],
      user.email = auth['info']['email'],
      user.expires_at = Time.at(auth['credentials']['expires_at'])
      user.save!
    end
  end
end
