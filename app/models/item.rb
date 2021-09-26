class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to_active_hash :prefecture
  belongs_to :day

  belongs_to :user
  has_one_attached :image
  # - has_many :buyers

  with_options presence: true do
    validates :items_name
    validates :explanation
    validates :image

    with_options numericality: { other_than: 1, message: "is invalid. choose on and after 2"} do
      validates :category_id
      validates :condition_id
      validates :postage_id
      validates :prefecture_id
      validates :days_id
    end

    validates :price, format: {with: /\A[\d]+\z/}, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  end
end
