class CreateAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :auctions do |t|
      t.references :shift, null: false, foreign_key: true
      t.integer :price
      t.string :description
      t.integer :status

      t.timestamps
    end
  end
end
