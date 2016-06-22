class ChangePersonalityQuestions < ActiveRecord::Migration
  def change
    add_column :personality_questions, :religiousness, :integer
    add_column :personality_questions, :age, :integer
    add_column :personality_questions, :profession, :string
    add_column :personality_questions, :usp, :boolean, default: false
  end
end
