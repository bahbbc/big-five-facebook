class PersonalityCalculator

  def initialize(personality_questions)
    @personality_questions = personality_questions
  end

  def calculate
    {
      agreeableness: Agreeableness.new(@personality_questions).personality,
      conscientiousness: Conscientiousness.new(@personality_questions).personality,
      extraversion: Extraversion.new(@personality_questions).personality,
      neuroticism: Neuroticism.new(@personality_questions).personality,
      openness: Openness.new(@personality_questions).personality
    }
  end
end
