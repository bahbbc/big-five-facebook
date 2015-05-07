class AddUserIdToUserPersonality < ActiveRecord::Migration
  def change
    add_reference :user_personalities, :user, index: true
  end
end
