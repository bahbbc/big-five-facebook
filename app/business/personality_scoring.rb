module PersonalityScoring

  def compute(questions)
    sum = 0
    questions.each do |question|
      sum =+ question
    end
    sum/questions.length
  end

  def reverse_count(question)
    new_count = question - 6
    return -(new_count) if new_count < 0
    new_count
  end
end

class Extraverson
  include PersonalityScoring

  def initialize(personality_questions)
    @personality_questions
  end

  def personality
    compute([@personality_questions.one_speaker, reverse_count(@personality_questions.six_quiet),
    @personality_questions.eleven_energy, @personality_questions.sixteen_enthusiastic,
    reverse_count(@personality_questions.twenty_one_calm),  @personality_questions.twenty_six_assertive,
    reverse_count(@personality_questions.thirty_one_shy), @personality_questions.thirty_six_friendly])
  end

end
