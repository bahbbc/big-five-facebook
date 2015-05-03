require 'rails_helper'

describe 'PersonalityScoring' do

  describe '#reverse_count' do

    let(:personality_questions){ { one_speaker: 5, six_quiet: 3 } }

    it 'returns 1 when score is 5' do
      expect(Extraversion.new(personality_questions).reverse_count(personality_questions[:one_speaker])).to eql 1
    end

    it 'returns 3 when score is 3' do
      expect(Extraversion.new(personality_questions).reverse_count(personality_questions[:six_quiet])).to eql 3
    end
  end

  describe "#count" do
    let(:personality_questions){
      PersonalityQuestion.new(one_speaker: 5, six_quiet: 3, eleven_energy: 4,
        sixteen_enthusiastic: 2, twenty_one_calm: 1,
        twenty_six_assertive: 2, thirty_one_shy: 5,
        thirty_six_friendly: 3
      )
    }

    it 'returns 3 when score is 3' do
      expect(Extraversion.new(personality_questions).personality).to eql 3
    end

  end
end