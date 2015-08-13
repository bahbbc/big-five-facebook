class PostRetriever
  def initialize(user)
    @connection = Faraday.new('https://graph.facebook.com/v2.3/')
    @user = user
  end

  def user_post
    @connection.get("me/posts?fields=message,created_time&limit=999&access_token=#{@user.token}")
  end

  def create
    posts = JSON.parse(user_post.body)['data']
    posts.each do |post|
      Post.create(
        user_id: @user.id,
        message: post['message'],
        created_time: post['created_time']
      ) if post['message']
    end
  end
end
