class UserPersonality < ActiveRecord::Base
  def create_score(score)
    update_attributes(
      extraversion: score[:extraversion],
      agreeableness: score[:agreeableness],
      conscientiousness: score[:conscientiousness],
      neuroticism: score[:neuroticism],
      openness: score[:openness])
  end
end
