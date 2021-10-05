class BuyersShippingAdd
  include ActiveModel::Model
  attr_accessor :postal_number, :prefecture_id, :city, :address, :building_name, :tel, :item_id, :user_id

  with_options presence: true do
    validates :postal_number, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. include hyphen(-)"}
    validates :city
    validates :address
    validates :tel,           format: {with: /\A\d{,11}\z/, message: "is invalid."}
    validates :prefecture_id, numericality: { other_than: 1, message: "is invalid. choose on and after 2" }
    validates :user_id
  end

  def save
    buyers = Buyer.create(user_id: user_id, item_id: item_id)
    ShippingAdd.create(postal_number: postal_number, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, tel: tel, buyers_id: buyers.id )
  end


end