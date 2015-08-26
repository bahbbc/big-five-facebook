require 'rails_helper'

RSpec.describe PersonalityQuestionsController, type: :controller do
  describe 'POST create' do
    let(:personality_questions) { build(:personality_question) }
    let(:invalid_personality_questions) { build(:personality_question, eight_careless: nil) }
    let(:user) { build(:user) }

    before { allow(controller).to receive(:current_user) { user } }

    context 'when it works' do
      it 'calls post retriever' do
        user_personality = double

        expect(UserPersonality).to receive_message_chain(:where, :first_or_create, :create_score) { user_personality }

        expect(RetrievePostsWorker).to receive(:perform_async)

        post :create, personality_question: personality_questions.attributes

        expect(response).to redirect_to(:personality_questions)
      end
    end

    context 'when it fails' do
      it 'renders errors' do
        expect(RetrievePostsWorker).to_not receive(:perform_async)

        post :create, personality_question: invalid_personality_questions.attributes

        expect(response).to render_template(:new)
      end
    end
  end
end