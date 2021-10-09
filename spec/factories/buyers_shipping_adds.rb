FactoryBot.define do
  factory :buyers_shipping_add do
    postal_number       {'123-4567'}
    prefecture_id       {2}
    city                {'名古屋市'}
    address             {'12-34'}
    building_name       {'コート東山'}
    tel                 {'09012345678'}
    token               {"tok_abcdefghijk00000000000000000"}
  end
end
