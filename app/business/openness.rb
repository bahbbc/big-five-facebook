class Openness
  include PersonalityScoring

  def initialize(personality_questions)
    @personality_questions = personality_questions
  end

  def personality
    compute([@personality_questions.nine_stressless, @personality_questions.eleven_energy,
        @personality_questions.thirteen_confidence_worker, reverse_count(@personality_questions.twenty_four_stable),
        @personality_questions.twenty_five_inventive, @personality_questions.thirty_three_eficient,
        @personality_questions.thirty_five_routine, @personality_questions.thirty_nine_easily_nervous,
        reverse_count(@personality_questions.fourty_three_distractive), @personality_questions.fourty_four_sofisticated])
  end
end
