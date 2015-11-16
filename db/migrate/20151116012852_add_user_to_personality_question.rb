class AddUserToPersonalityQuestion < ActiveRecord::Migration
  def change
    add_reference :personality_questions, :user, index: true
  end
end
