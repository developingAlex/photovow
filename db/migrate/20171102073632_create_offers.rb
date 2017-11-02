class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.references :photographer, foreign_key: { to_table: :users }
      t.decimal :amount
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
