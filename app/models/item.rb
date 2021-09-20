class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  berongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :day

  has_many :items
  has_one_attached :image
  # - has_many :buyers

  with_options presence: true do
    validates :items_name
    validates :explanation
    validates :price
    validates :image

    with_options numericality: { other_than: 1, message: "can't be blank"} do
      validates :category_id
      validates :condition_id
      validates :postage_id
      validates :prefecture_id
      validates :days_id
    end
  end
end
