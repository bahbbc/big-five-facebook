require 'rails_helper'

RSpec.describe PersonalityQuestionsController, type: :controller do
  describe '#create' do
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

  describe '#new' do
    let(:user) { build(:user) }
    before { allow(controller).to receive(:current_user) { user } }

    context 'when user allowed posts permission' do
      let(:empty_data) { {"data" => []} }

      it 'redirects to missing_permission' do
        allow(PostRetriever).to receive_message_chain(:new, :user_post, :body) { empty_data.to_json }

        get :new

        expect(response).to redirect_to(:missing_permission)
      end
    end

    context 'when user dissalowed posts permission' do
      let(:some_data) do
        {'data' => [{
          'id' => '813693328695809_924310730967401' }, { 'message' => 'Revisão sistemática 2 - O Trabalho Final'
        }]}
      end

      it 'shows personality_questions' do
        allow(PostRetriever).to receive_message_chain(:new, :user_post, :body) { some_data.to_json }

        get :new

        expect(response).to render_template(:new)
      end
    end
  end
end
