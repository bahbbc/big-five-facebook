class PostRetriever
  def initialize(user)
    @connection = Faraday.new('https://graph.facebook.com/v2.3/')
    @user = user
  end

  def user_post(limit = 999)
    @connection.get("me/posts?fields=message,created_time&limit=#{limit}&access_token=#{@user.token}")
  end

  def create
    Post.create({posts: user_post.body, user_id: @user.id})
  end
end
