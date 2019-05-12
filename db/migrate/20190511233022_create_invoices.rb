class CreateInvoices < ActiveRecord::Migration[5.1]
  def self.up
    create_table :invoices do |t|
      t.string :name
      t.binary :file, :limit => 10.megabyte 
      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
