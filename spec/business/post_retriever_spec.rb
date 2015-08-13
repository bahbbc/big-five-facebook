require 'rails_helper'
require 'webmock/rspec'

describe PostRetriever do
  describe '#create' do
    let(:facebook_posts) do
      {
          'data' => [{
            'id' => '813693328695809_924310730967401' },
            { 'message' => 'Revisão sistemática 2 - O Trabalho Final',
              'id' => '813693328695809_917830054948802' }] }.to_json
    end

    let(:user) { create(:user) }

    before do
      stub_request(:get, 'https://graph.facebook.com/v2.3/me/posts?access_token=XPTO&fields=message,created_time&limit=999')
        .to_return(status: 200, body: facebook_posts, headers: {})
    end

    it 'creates a post' do
      expect { described_class.new(user).create }.to change { Post.count }.by(1)
    end
  end
end
