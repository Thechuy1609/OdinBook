class Message < ApplicationRecord
belongs_to :chat
broadcasts_to :chat
validates_presence_of :content
validates :content, length: { maximum: 150 }
end
