class ChangeFacebookIdSize < ActiveRecord::Migration
  def change
    change_column :users, :facebook_id, :text
  end
end
