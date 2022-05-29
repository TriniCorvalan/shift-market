class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.references :auction, null: false, foreign_key: true
      t.references :shift, null: false, foreign_key: true
      t.references :bidder, null: false, foreign_key: {to_table: :users}
      t.integer :status
      t.string :description

      t.timestamps
    end
  end
end
