class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.references :owner, foreign_key: { to_table: :users}
      t.string :title
      t.string :venue
      t.string :city
      t.string :country
      t.text :content
      t.date :date
      t.integer :accepted_offer
      t.date :date_accepted

      t.timestamps
    end
  end
end
