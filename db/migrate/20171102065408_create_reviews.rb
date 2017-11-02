class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :author, foreign_key: { to_table: :users}
      t.references :portfolio, foreign_key: true
      t.text :content
      t.decimal :rating

      t.timestamps
    end
  end
end
