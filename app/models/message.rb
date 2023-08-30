class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  before_create :confirm_participant

  after_create_commit { broadcast_append_to self.chat_room }

  def confirm_participant
    return unless chat_room.privacy

    is_participant = Participant.where(user_id: user.id, chat_room_id: chat_room.id).first
    throw :abort unless is_participant
  end
end
