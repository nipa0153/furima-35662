class Buyer < ApplicationRecord
  has_one    :shipping_add
  belongs_to :user
  belongs_to :item
end
