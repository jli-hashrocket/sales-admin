class CreateMerchants < ActiveRecord::Migration[5.1]
  def self.up
    create_table :merchants do |t|
      t.string :name
      t.string :address
      t.timestamps
    end
  end

  def self.down
    drop_table :merchants
  end
end
