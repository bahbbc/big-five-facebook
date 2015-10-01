require 'csv'

class FileCreator
  def normalize_posts
    Post.all.each do |data|
      file_name = "#{Time.zone.now}-User-#{data.user_id}.csv"

      CSV.open(file_path(file_name), 'w') do |csv|
        csv << [data.user_id.to_s]
        data.posts['data'].each do |message|
          post = message['message']
          csv << [post] if post.present?
        end
      end
      dropbox_upload(file_path(file_name), file_name)
    end
  end

  def user_and_class_data
    file_name = "#{Time.zone.now}-TotalUsers.csv"

    CSV.open(file_path(file_name), 'w') do |csv|
      csv << users_table_index
      User.all.each do |user|
        personality_result = user.user_personality
        next if personality_result.nil?

        csv << [user.link, user.location, user.token, user.nickname, user.gender, user.email,
                user.name, user.facebook_id, personality_result.extraversion, personality_result.agreeableness,
                personality_result.conscientiousness, personality_result.neuroticism, personality_result.openness]
      end
    end
    dropbox_upload(file_path(file_name), file_name)
  end

  private

  def users_table_index
    %w(link location token nickname gender email name facebook_id extraversion agreeableness conscientiousness
       neuroticism openness)
  end

  def file_path(file_name)
    "#{Rails.root}/tmp/posts#{file_name}"
  end

  def dropbox_upload(file_path, file_name)
    DropboxUploader.new(dropbox_secret).upload_file(file_path, file_name)
  end

  def dropbox_secret
    @dropbox_secret ||= DropboxUploader.new(nil).generate_access_token[0]
  end
end
