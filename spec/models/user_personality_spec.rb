require 'rails_helper'

RSpec.describe UserPersonality, type: :model do
  describe '.already_anwered?' do
    subject(:user_personality) { described_class.already_anwered?(current_user) }

    context 'an user with personality_questions' do
      let(:personality_questions) { create(:user_personality) }
      let(:current_user) { personality_questions.user }

      it { expect(user_personality).to be_truthy }
    end

    context 'an user without personality_questions' do
      let(:current_user) { create(:user) }

      it { expect(user_personality).to be_falsey }
    end
  end
end
