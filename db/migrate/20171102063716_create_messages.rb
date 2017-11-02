class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.references :conversation, foreign_key: { to_table: :users }
      t.text :content
      t.datetime :time_read

      t.timestamps
    end
  end
end
