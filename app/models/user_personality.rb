class UserPersonality < ActiveRecord::Base
  belongs_to :user

  def create_score(score)
    update_attributes(
      extraversion: score[:extraversion],
      agreeableness: score[:agreeableness],
      conscientiousness: score[:conscientiousness],
      neuroticism: score[:neuroticism],
      openness: score[:openness])
  end

  def self.already_anwered?(user)
    find_by(user_id: user.id) ? true : false
  end
end
