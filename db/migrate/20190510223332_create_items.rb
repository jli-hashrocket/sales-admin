class CreateItems < ActiveRecord::Migration[5.1]
  def self.up
    create_table :items do |t|
      t.string :description
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :merchant_id
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
