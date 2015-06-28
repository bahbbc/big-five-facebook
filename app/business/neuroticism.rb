class Neuroticism
  include PersonalityScoring

  def initialize(personality_questions)
    @personality_questions = personality_questions
  end

  def personality
    compute([ @personality_questions.seven_prestative, @personality_questions.ten_curiosity,
      reverse_count(@personality_questions.fourteen_tense), reverse_count(@personality_questions.twenty_one_calm),
      reverse_count(@personality_questions.twenty_three_lazy), @personality_questions.thirty_four_calm_in_tense,
      @personality_questions.thirty_six_friendly, @personality_questions.fourty_one_low_artistic)])
  end
end
