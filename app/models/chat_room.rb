class ChatRoom < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :messages, dependent: :destroy

  scope :public_rooms, -> { where(privacy: false) }

  after_create_commit { broadcast_append_to 'chat_rooms' }
end
