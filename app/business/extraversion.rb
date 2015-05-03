class Extraversion
  include PersonalityScoring

  def initialize(personality_questions)
    @personality_questions = personality_questions
  end

  def personality
    compute([@personality_questions.one_speaker, reverse_count(@personality_questions.six_quiet),
    @personality_questions.eleven_energy, @personality_questions.sixteen_enthusiastic,
    reverse_count(@personality_questions.twenty_one_calm),  @personality_questions.twenty_six_assertive,
    reverse_count(@personality_questions.thirty_one_shy), @personality_questions.thirty_six_friendly])
  end

end
