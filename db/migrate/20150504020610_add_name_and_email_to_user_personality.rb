class AddNameAndEmailToUserPersonality < ActiveRecord::Migration
  def change
    add_column :user_personalities, :email, :string
    add_column :user_personalities, :name, :string
  end
end
