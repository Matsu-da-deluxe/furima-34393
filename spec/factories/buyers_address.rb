FactoryBot.define do
  factory :buyers_address do
    postal_code { '123-4567' }
    area_id { 9 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_num {'09009878876'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
