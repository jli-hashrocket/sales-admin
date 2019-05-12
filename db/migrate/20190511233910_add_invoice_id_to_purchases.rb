class AddInvoiceIdToPurchases < ActiveRecord::Migration[5.1]
  def self.up
    add_column :purchases, :invoice_id, :integer, default: false
  end

  def self.down
    remove_column :purchases, :invoice_id
  end
end
