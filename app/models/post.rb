class Post < ApplicationRecord
  validates :content, length: { minimum: 15 }
  validates :content, presence: true
  belongs_to :user, foreign_key: "user_id"
end
