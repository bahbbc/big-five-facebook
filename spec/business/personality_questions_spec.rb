require 'rails_helper'

describe 'PersonalityScoring' do

  describe '#reverse_count' do

    let(:personality_questions){ { one_speaker: 5, six_quiet: 3 } }

    it 'returns 1 when score is 5' do
      score = PersonalityScoring.new(personality_questions)

      expect(score.reverse_count(personality_questions[:one_speaker])).to eql 1
    end

    it 'returns 3 when score is 3' do
      score = PersonalityScoring.new(personality_questions)

      expect(score.reverse_count(personality_questions[:six_quiet])).to eql 3
    end
  end
end