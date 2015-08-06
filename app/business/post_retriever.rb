class PostRetriever
  def initialize(user)
    @connection = Faraday.new('https://graph.facebook.com/v2.4/')
    @user = user
  end

  def user_post
    @connection.get('me?fields=posts.limit(999){message, created_time}') do |req|
      req.params['access_token'] = @user.token
    end
  end

  def create
    posts = JSON.parse(user_post.body)['posts']['data']
    posts.each do |post|
      Post.create(
        user_id: @user.id,
        message: post['message'],
        created_time: post['created_time']
      ) if post['message']
    end
  end
end
