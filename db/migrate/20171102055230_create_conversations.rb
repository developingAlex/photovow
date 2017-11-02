class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :sender_id, foreign_key: { to_table: :users }
      t.references :recipient_id, foreign_key: { to_table: :users }

      t.timestamps

      add_index :sender_id
      add_index :recipient_id
    end
  end
end
