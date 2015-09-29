require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe '.trait_percentage' do
    context 'when reverse is false' do
      let(:personality) { double('Personality', extraversion: 3) }
      it 'returns 60' do
        expect(helper.trait_percentage(personality, 'extraversion')).to eql 60
      end
    end

    context 'when reverse is true' do
      let(:personality) { double('Personality', extraversion: 3) }
      it 'returns 60' do
        expect(helper.trait_percentage(personality, 'extraversion', true)).to eql 40
      end
    end
  end
end
