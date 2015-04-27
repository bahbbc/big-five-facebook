class Openness
  include PersonalityScoring

  def initialize(personality_questions)
    @personality_questions
  end

  def personality
    compute([@personality_questions.five_original, @personality_questions.ten_curiosity,
    @personality_questions.fifteen_thinker, @personality_questions.twenty_imaginative,
    @personality_questions.twenty_five_inventive, @personality_questions.thrty_experience,
    reverse_count(@personality_questions.thirty_five_routine), @personality_questions.thirty_eight_planner,
    @personality_questions.fourty_like_thin, reverse_count(@personality_questions.fourty_one_low_artistic),
    @personality_questions.fourty_four_sofisticated])
  end
end
