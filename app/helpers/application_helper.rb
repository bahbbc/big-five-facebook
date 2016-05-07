module ApplicationHelper
  def trait_percentage(personality, trait, reverse = false)
    trait = (personality.send(trait) * 20).round

    reverse ? (100 - trait) : trait
  end
end
