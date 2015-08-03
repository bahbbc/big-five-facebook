require 'rails_helper'

describe PostRetriever do
  describe '#create' do
    let(:facebook_posts) do
      {
        'posts' => {
          'data' => [{
            'id' => '813693328695809_924310730967401' },
            { 'message' => 'Revisão sistemática 2 - O Trabalho Final',
              'id' => '813693328695809_917830054948802' }] }
      }.to_json
    end

    let(:user) { create(:user) }

    before do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get('https://graph.facebook.com/v2.4/me?access_token=XPTO&fields=posts.limit%28999%29%7Bmessage%2C+created_time%7D') { |env| [200, {}, 'egg'] }
      end
    end

    it 'creates a post' do
      expect { described_class.new(user).create }.to change { Post.count }
    end
  end
end
