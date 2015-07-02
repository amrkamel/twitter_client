class CreateUserConversations < ActiveRecord::Migration
  def change
    create_table :user_conversations do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :conversation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
