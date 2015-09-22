module ApplicationHelper
  def trait_percentage(personality, trait, reverse = false)
    trait = personality.send(trait) * 20

    reverse ? trait : (100 - trait)
  end
end
