class ChangeMessageToJson < ActiveRecord::Migration
  def change
    change_column :posts, :message, 'json USING message::JSON'
    rename_column :posts, :message, :posts
    remove_column :posts, :created_time
  end
end
