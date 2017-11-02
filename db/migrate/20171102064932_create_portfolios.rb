class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.text :bio
      t.references :user, foreign_key: true
      t.text :avatar_data
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
