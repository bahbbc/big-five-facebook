require 'csv'

class FileCreator
  def normalize_posts
    Post.not_migrated.each do |data|
      file_name = "#{Time.zone.now}-User-#{data.user_id}.csv"

      CSV.open(file_path(file_name), 'w') do |csv|
        csv << [data.user_id.to_s]
        data.posts['data'].each do |message|
          post = message['message']
          csv << [post] if post.present?
        end
      end
      dropbox_upload(file_path(file_name), file_name)
      data.update_attributes(imported: true)
    end
  end

  def user_name_and_class
    file_name = "#{Time.zone.now}-ClassUsers.csv"
    CSV.open(file_path(file_name), 'w') do |csv|
      csv << %w(id nome extraversion agreeableness conscientiousness neuroticism openness created_at)
      User.all.each do |user|
        personality_result = user.user_personality
        next if personality_result.nil?
        csv << [user.id, user.nickname, personality_result.extraversion, personality_result.agreeableness,
                personality_result.conscientiousness, personality_result.neuroticism, personality_result.openness, personality_result.created_at]
      end
    end
    dropbox_upload(file_path(file_name), file_name)
  end

  def question_data
    file_name = "#{Time.zone.now}-Questions.csv"

    CSV.open(file_path(file_name), 'w') do |csv|
      csv << questions_table
        PersonalityQuestion.all.each do |question|
          csv << [question.id ,question.created_at, question.one_speaker, question.two_show_defects,
                  question.three_exaustive_work, question.four_sad, question.five_original, question.six_quiet,
                  question.seven_prestative, question.eight_careless, question.nine_stressless, question.ten_curiosity,
                  question.eleven_energy, question.twelve_fighter, question.thirteen_confidence_worker, question.fourteen_tense,
                  question.fifteen_thinker, question.sixteen_enthusiastic, question.seventeen_forgive,
                  question.eighteen_unorganized, question.ninteen_concerned, question.twenty_imaginative,
                  question.twenty_one_calm, question.twenty_two_others_trust, question.twenty_three_lazy,
                  question.twenty_four_stable, question.twenty_five_inventive, question.twenty_six_assertive,
                  question.twenty_seven_cold, question.twenty_eight_perseverant, question.twenty_nine_instable,
                  question.thrty_experience, question.thirty_one_shy, question.thirty_two_good,
                  question.thirty_three_eficient, question.thirty_four_calm_in_tense, question.thirty_five_routine,
                  question.thirty_six_friendly, question.thirty_seven_rude, question.thirty_eight_planner,
                  question.thirty_nine_easily_nervous, question.fourty_like_think, question.fourty_one_low_artistic,
                  question.fourty_two_cooperative, question.fourty_three_distractive, question.fourty_four_sofisticated]
      end
    end
    dropbox_upload(file_path(file_name), file_name)
  end

  def user_and_class_data
    file_name = "#{Time.zone.now}-TotalUsers.csv"

    CSV.open(file_path(file_name), 'w') do |csv|
      csv << users_table_minor
      User.all.each do |user|
        personality_result = user.user_personality
        question = user.personality_question
        next if personality_result.nil?
          csv << [user.id, user.location, user.token, user.nickname, user.gender, user.email,
                  user.name, user.facebook_id, personality_result.extraversion, personality_result.agreeableness,
                  personality_result.conscientiousness, personality_result.neuroticism, personality_result.openness,
                  user.link, personality_result.created_at, question.created_at, question.one_speaker, question.two_show_defects,
                  question.three_exaustive_work, question.four_sad, question.five_original, question.six_quiet,
                  question.seven_prestative, question.eight_careless, question.nine_stressless, question.ten_curiosity,
                  question.eleven_energy, question.twelve_fighter, question.thirteen_confidence_worker, question.fourteen_tense,
                  question.fifteen_thinker, question.sixteen_enthusiastic, question.seventeen_forgive,
                  question.eighteen_unorganized, question.ninteen_concerned, question.twenty_imaginative,
                  question.twenty_one_calm, question.twenty_two_others_trust, question.twenty_three_lazy,
                  question.twenty_four_stable, question.twenty_five_inventive, question.twenty_six_assertive,
                  question.twenty_seven_cold, question.twenty_eight_perseverant, question.twenty_nine_instable,
                  question.thrty_experience, question.thirty_one_shy, question.thirty_two_good,
                  question.thirty_three_eficient, question.thirty_four_calm_in_tense, question.thirty_five_routine,
                  question.thirty_six_friendly, question.thirty_seven_rude, question.thirty_eight_planner,
                  question.thirty_nine_easily_nervous, question.fourty_like_think, question.fourty_one_low_artistic,
                  question.fourty_two_cooperative, question.fourty_three_distractive, question.fourty_four_sofisticated]
      end
    end
    dropbox_upload(file_path(file_name), file_name)
  end

  private

  def questions_table
    %w(question_id question_created_at one_speaker two_show_defects three_exaustive_work four_sad five_original
       six_quiet seven_prestative eight_careless nine_stressless ten_curiosity eleven_energy twelve_fighter
       thirteen_confidence_worker fourteen_tense fifteen_thinker sixteen_enthusiastic seventeen_forgive
       eighteen_unorganized ninteen_concerned twenty_imaginative twenty_one_calm twenty_two_others_trust
       twenty_three_lazy twenty_four_stable twenty_five_inventive twenty_six_assertive twenty_seven_cold
       twenty_eight_perseverant twenty_nine_instable thrty_experience thirty_one_shy thirty_two_good
       thirty_three_eficient thirty_four_calm_in_tense thirty_five_routine thirty_six_friendly
       thirty_seven_rude thirty_eight_planner thirty_nine_easily_nervous fourty_like_think
       fourty_one_low_artistic fourty_two_cooperative fourty_three_distractive fourty_four_sofisticated)
  end

  def users_table_index
    %w(id extraversion agreeableness conscientiousness
       neuroticism openness link personality_created_at question_created_at one_speaker two_show_defects three_exaustive_work four_sad five_original
       six_quiet seven_prestative eight_careless nine_stressless ten_curiosity eleven_energy twelve_fighter
       thirteen_confidence_worker fourteen_tense fifteen_thinker sixteen_enthusiastic seventeen_forgive
       eighteen_unorganized ninteen_concerned twenty_imaginative twenty_one_calm twenty_two_others_trust
       twenty_three_lazy twenty_four_stable twenty_five_inventive twenty_six_assertive twenty_seven_cold
       twenty_eight_perseverant twenty_nine_instable thrty_experience thirty_one_shy thirty_two_good
       thirty_three_eficient thirty_four_calm_in_tense thirty_five_routine thirty_six_friendly
       thirty_seven_rude thirty_eight_planner thirty_nine_easily_nervous fourty_like_think
       fourty_one_low_artistic fourty_two_cooperative fourty_three_distractive fourty_four_sofisticated)
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
