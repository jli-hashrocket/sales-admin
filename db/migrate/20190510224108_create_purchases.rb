class CreatePurchases < ActiveRecord::Migration[5.1]
  def self.up
    create_table :purchases do |t|
      t.integer :customer_id
      t.integer :item_id
      t.integer :quantity
      t.timestamps
    end
  end

  def self.down
    drop_table :purchases
  end
end
