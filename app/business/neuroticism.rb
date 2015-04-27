class Neuroticism
  include PersonalityScoring

  def initialize(personality_questions)
    @personality_questions
  end

  def personality
    compute([@personality_questions.four_sad, reverse_count(@personality_questions.nine_stressless),
    @personality_questions.fourteen_tense, @personality_questions.ninteen_concerned,
    reverse_count(@personality_questions.twenty_four_stable), @personality_questions.twenty_nine_instable,
    reverse_count(@personality_questions.thirty_four_calm_in_tense),
    @personality_questions.thirty_nine_easily_nervous])
  end
end
