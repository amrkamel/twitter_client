class UserConversation < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :conversation, required: true

  validates :user, uniqueness: { scope: :conversation }
end
