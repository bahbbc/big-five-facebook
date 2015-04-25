class PersonalityScoring

  def initialize(personality_questions)
    @personality_questions = personality_questions
  end

  def compute(questions_hash)
    sum = 0
    questions_hash.each do |question|
      sum =+ question
    end
    sum/questions_hash.length
  end

  def extraversion
    (@personality_questions.one_speaker + reverse_count(@personality_questions.six_quiet) +
    @personality_questions.eleven_energy + @personality_questions.sixteen_enthusiastic +
    reverse_count(@personality_questions.twenty_one_calm) +  @personality_questions.twenty_six_assertive +
    reverse_count(@personality_questions.thirty_one_shy) + @personality_questions.thirty_six_friendly)/8
  end

  def agreeableness
    (reverse_count(@personality_questions.two_show_defects) + @personality_questions.seven_prestative +
    reverse_count(@personality_questions.twelve_fighter) + @personality_questions.twenty_two_others_trust +
    reverse_count(@personality_questions.twenty_seven_cold) + @personality_questions.thirty_two_good +
    reverse_count(@personality_questions.thirty_seven_rude) + @personality_questions.fourty_two_cooperative)/8
  end

  def conscientiousness
    (@personality_questions.three_exaustive_work + reverse_count(@personality_questions.eight_careless) +
    @personality_questions.thirteen_confidence_worker + reverse_count(@personality_questions.eighteen_unorganized) +
    reverse_count(@personality_questions.twenty_three_lazy) + @personality_questions.twenty_eight_perseverant +
    @personality_questions.thirty_three_eficient + reverse_count(@personality_questions.fourty_three_distractive))/8
  end

  def neuroticism
    (@personality_questions.four_sad + reverse_count(@personality_questions.nine_stressless) +
    @personality_questions.fourteen_tense + @personality_questions.ninteen_concerned +
    reverse_count(@personality_questions.twenty_four_stable) + @personality_questions.twenty_nine_instable +
    reverse_count(@personality_questions.thirty_four_calm_in_tense) +
    @personality_questions.thirty_nine_easily_nervous)/8
  end

  def openness
    (@personality_questions.five_original + @personality_questions.ten_curiosity +
    @personality_questions.fifteen_thinker + @personality_questions.twenty_imaginative +
    @personality_questions.twenty_five_inventive + @personality_questions.thrty_experience +
    reverse_count(@personality_questions.thirty_five_routine) + @personality_questions.thirty_eight_planner +
    @personality_questions.fourty_like_thin + reverse_count(@personality_questions.fourty_one_low_artistic) +
    @personality_questions.fourty_four_sofisticated)/10
  end

  def reverse_count(question)
    new_count = question - 6
    return -(new_count) if new_count < 0
    new_count
  end


end
