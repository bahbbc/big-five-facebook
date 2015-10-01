class Extraversion
  include PersonalityScoring

  def initialize(personality_questions)
    @personality_questions = personality_questions
  end

  def personality
    compute([
      @personality_questions.one_speaker, @personality_questions.five_original,
      reverse_count(@personality_questions.twelve_fighter), reverse_count(@personality_questions.sixteen_enthusiastic),
      @personality_questions.twenty_six_assertive, @personality_questions.twenty_nine_instable,
      @personality_questions.thirty_seven_rude, reverse_count(@personality_questions.fourty_two_cooperative)
    ])
  end
end
