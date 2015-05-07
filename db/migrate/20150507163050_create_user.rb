class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :link
      t.string :location
      t.string :token
      t.datetime :expires_at
      t.string :nickname
      t.string :gender
      t.string :email
      t.string :name
    end
  end
end
