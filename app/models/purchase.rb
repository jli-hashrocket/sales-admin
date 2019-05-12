class Purchase < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  belongs_to :invoice

end
