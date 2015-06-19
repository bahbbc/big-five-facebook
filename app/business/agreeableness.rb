class Agreeableness
  include PersonalityScoring

  def initialize(personality_questions)
    @personality_questions = personality_questions
  end

  def personality
    compute([ reverse_count(@personality_questions.two_show_defects), reverse_count(@personality_questions.three_exaustive_work),
      @personality_questions.eight_careless, @personality_questions.fifteen_thinker,
      @personality_questions.eighteen_unorganized, @personality_questions.twenty_seven_cold,
      reverse_count(@personality_questions.twenty_eight_perseverant), reverse_count(@personality_questions.thrty_experience),
      @personality_questions.fourty_like_think])
  end
end
