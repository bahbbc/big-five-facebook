class Post < ActiveRecord::Base
  has_one :user

  scope :not_migrated, -> { where(imported: false) }

  def self.migrate
    update_attributes(imported: true)
  end
end
