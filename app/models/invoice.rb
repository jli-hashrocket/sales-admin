require 'csv'

class Invoice < ApplicationRecord
  has_many :purchases

  def parse_csv(csv)
    # clean_out_databases
    csv_file = CSV.read(csv.tempfile, :headers => true)
    csv_file.each do |row|
      row = row.to_h
      customer_name = row["Customer Name"].split
      customer = Customer.find_or_create_by(first_name: customer_name.first, last_name: customer_name.last)
      merchant = Merchant.find_or_create_by(name: row["Merchant Name"], address: row["Merchant Address"])
      item = Item.find_or_create_by(description: row["Item Description"], price: row["Item Price"].to_f, merchant_id: merchant.id) 
      purchase = Purchase.create(customer_id: customer.id, item_id: item.id, quantity: row["Quantity"].to_i, invoice_id: id)
    end
  end

  def total_revenue
    connection ||= ActiveRecord::Base.connection.raw_connection.prepare(
      "select SUM(purchases.quantity * items.price) total from purchases join items on item_id=items.id where invoice_id=? group by items.price, purchases.quantity"
      )
    result = connection.execute(id)
    result.to_a.flatten.map{|n| n.to_f}.sum
  end
end
