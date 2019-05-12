class CreateCustomer < ActiveRecord::Migration[5.1]
  def self.up
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
