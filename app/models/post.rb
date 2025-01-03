class Post < ApplicationRecord
  validates :content, length: { minimum: 10 }
  validates :content, presence: true
  belongs_to :user, foreign_key: "user_id"
  acts_as_likeable
  has_many :comments, dependent: :destroy
  has_rich_text :content
  has_one_attached :avatar
end
