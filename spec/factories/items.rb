FactoryBot.define do
  factory :item do
    product_name { 'test' }
    explanatory_name { 'test' }
    price { 500 }
    category_id  { 3 }
    status_id    { 1 }
    delivery_fee_id  { 1 }
    area_id { 1 }
    days_id { 1 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test2.png'), filename: 'test2.png')
    end
  end
end
