class Item < ApplicationRecord
  has_many :purchases
  belongs_to :merchant
end
