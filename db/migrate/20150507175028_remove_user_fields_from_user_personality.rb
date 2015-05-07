class RemoveUserFieldsFromUserPersonality < ActiveRecord::Migration
  def change
    remove_column :user_personalities, :name, :string
    remove_column :user_personalities, :email, :string
  end
end
