class Conscientiousness
  include PersonalityScoring

  def initialize(personality_questions)
    @personality_questions = personality_questions
  end

  def personality
    compute([@personality_questions.four_sad, @personality_questions.six_quiet,
      reverse_count(@personality_questions.seventeen_forgive), reverse_count(@personality_questions.ninteen_concerned)
      @personality_questions.twenty_imaginative, reverse_count(@personality_questions.twenty_two_others_trust),
      @personality_questions.thirty_one_shy, @personality_questions.thirty_two_good,
      reverse_count(@personality_questions.thirty_eight_planner)])
  end
end
