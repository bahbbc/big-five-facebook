class ChangeUserPersonalityType < ActiveRecord::Migration
  def change
    change_column :user_personalities, :extraversion, :decimal
    change_column :user_personalities, :agreeableness, :decimal
    change_column :user_personalities, :conscientiousness, :decimal
    change_column :user_personalities, :neuroticism, :decimal
    change_column :user_personalities, :openness, :decimal
  end
end
