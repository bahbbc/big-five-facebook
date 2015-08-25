class RetrievePostsWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    PostRetriever.new(user).create
  end
end
