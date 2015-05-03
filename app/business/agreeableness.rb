class Agreeableness
  include PersonalityScoring

  def initialize(personality_questions)
    @personality_questions = personality_questions
  end

  def personality
    compute([reverse_count(@personality_questions.two_show_defects), @personality_questions.seven_prestative,
    reverse_count(@personality_questions.twelve_fighter), @personality_questions.twenty_two_others_trust,
    reverse_count(@personality_questions.twenty_seven_cold), @personality_questions.thirty_two_good,
    reverse_count(@personality_questions.thirty_seven_rude), @personality_questions.fourty_two_cooperative])
  end
end
