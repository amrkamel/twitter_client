class Conversation < ActiveRecord::Base
  has_many :user_conversations, dependent: :destroy
  has_many :participants, class_name: 'User', foreign_key: 'user_id', source: :user, through: :user_conversations

  validates_uniqueness_of :subject
  validate :conversation_has_participants

  def at_least_two_participants?
    participants.size >=2
  end

  def conversation_has_participants
    unless at_least_two_participants?
      errors.add(:participants, 'You need to have at least two participants to create a conversation')
    end
  end
end
