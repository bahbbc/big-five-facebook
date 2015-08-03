class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :message
      t.datetime :created_time
    end
    add_reference :posts, :user, index: true
  end
end
