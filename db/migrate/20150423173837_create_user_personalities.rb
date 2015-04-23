class CreateUserPersonalities < ActiveRecord::Migration
  def change
    create_table :user_personalities do |t|
      t.integer :extraversion
      t.integer :agreeableness
      t.integer :conscientiousness
      t.integer :neuroticism
      t.integer :openness

      t.timestamps null: false
    end
  end
end
