class Post < ActiveRecord::Base
  has_one :user

  scope :not_migrated, -> { where(imported: false) }
end
