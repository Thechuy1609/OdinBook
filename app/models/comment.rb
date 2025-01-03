class Comment < ApplicationRecord
  belongs_to :post
  validates_presence_of :body
  validates_presence_of :commenter
  validates :body, length: { maximum: 40 }
end
