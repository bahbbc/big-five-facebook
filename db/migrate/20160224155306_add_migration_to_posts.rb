class AddMigrationToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :imported, :boolean, default: false
  end
end
