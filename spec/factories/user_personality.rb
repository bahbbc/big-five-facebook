FactoryGirl.define do
  factory :user_personality do
    extraversion 5
    agreeableness 2
    conscientiousness 1
    neuroticism 7
    openness 9

    association :user, factory: :user, strategy: :build
  end
end
