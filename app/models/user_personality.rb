class UserPersonality < ActiveRecord::Base
  def self.koala(access_token)
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object(' ')
  end

  def self.create_score(score)
    update_attributes(
      extraversion: score[:extraversion],
      agreeableness: score[:agreeableness],
      conscientiousness: score[:conscientiousness],
      neuroticism: score[:neuroticism],
      openness: score[:openness])
  end
end
