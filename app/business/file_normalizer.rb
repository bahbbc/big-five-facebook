class FileNormalizer
  def normalize_posts
    Post.all.each do |data|
      CSV.open("#{Rails.root}/tmp/posts---#{data.user_id}") do |csv|
        csv << data.user_id
        data.posts['data'].each do |message|
          post = message['message']
          csv << post if post.present?
        end
      end
    end
  end

  def user_and_class_data
    CSV.open("#{Rails.root}/tmp/users") do |csv|
      csv << %w(link location token nickname gender email name facebook_id extraversion agreeableness
                conscientiousness neuroticism openness)
      User.all.each do |user|
        personality_result = user.user_personality
        csv << [user.link, user.location, user.token, user.nickname, user.gender, user.email,
                user.name, user.facebook_id, personality_result.extraversion, personality_result.agreeableness,
                personality_result.conscientiousness, personality_result.neuroticism, personality_result.openness]
      end
    end
  end
end
