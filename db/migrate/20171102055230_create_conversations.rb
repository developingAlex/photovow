class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :sender_id, foreign_key: true
      t.references :recipient_id, foreign_key: true

      t.timestamps
    end
  end
end
