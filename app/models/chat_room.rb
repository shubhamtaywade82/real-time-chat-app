class ChatRoom < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy

  scope :public_rooms, -> { where(privacy: false) }

  after_create_commit { broadcast_if_public }

  def broadcast_if_public
    broadcast_append_to 'chat_rooms' unless privacy
  end

  def self.create_private_room(users, room_name)
    single_room = ChatRoom.create(name: room_name, privacy: true)
    users.each do |user|
      Participant.create(user_id: user.id, chat_room_id: single_room.id)
    end
    single_room
  end
end
