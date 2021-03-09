FactoryBot.define do
  factory :item do
    name { 'オムライス' }
    price         { 1000 }
    description   { '美味しい' }
    category_id   { 2 }
    status_id     { 2 }
    ship_fee_id   { 2 }
    day_id        { 2 }
    area_id       { 2 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end