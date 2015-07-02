class Message < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', required: true
  belongs_to :conversation, required: true

  def from
    author.twitter_username
  end

  def to
    conversation.participants.where.not(id: author_id).map(&:twitter_username)
  end
end
