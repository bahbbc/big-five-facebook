require 'csv'

module FileNormalizer
  def self.normalize_posts
    Post.all.each do |data|
      file_name = "-#{data.user_id}-#{Time.zone.now}.csv"
      file_path = "#{Rails.root}/tmp/posts#{file_name}"

      CSV.open(file_path, 'w') do |csv|
        csv << [data.user_id.to_s]
        data.posts['data'].each do |message|
          post = message['message']
          csv << [post] if post.present?
        end
      end
      dropbox_upload(file_path, file_name)
    end
  end

  def self.user_and_class_data
    CSV.open("#{Rails.root}/tmp/users-#{Time.zone.now}.csv", 'w') do |csv|
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

  def dropbox_upload(file_path, file_name)
    DropboxUploader.new(dropbox_secret).upload_file(file_path, file_name)
  end

  def dropbox_secret
    @access_token ||= DropboxUploader.new(nil).generate_access_token
  end
end
