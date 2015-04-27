class Conscientiousness
  include PersonalityScoring

  def initialize(personality_questions)
    @personality_questions
  end

  def personality
    compute([@personality_questions.three_exaustive_work, reverse_count(@personality_questions.eight_careless),
    @personality_questions.thirteen_confidence_worker, reverse_count(@personality_questions.eighteen_unorganized),
    reverse_count(@personality_questions.twenty_three_lazy), @personality_questions.twenty_eight_perseverant,
    @personality_questions.thirty_three_eficient, reverse_count(@personality_questions.fourty_three_distractive)])
  end
end
