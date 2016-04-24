module PersonalityScoring
  def compute(questions)
    sum = 0
    questions.each do |question|
      sum += question
    end
    sum.to_f / questions.length
  end

  def reverse_count(question)
    new_count = question - 6
    return -(new_count) if new_count < 0
    new_count
  end
end
