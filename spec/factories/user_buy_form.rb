FactoryBot.define do
  factory :user_buy_form do
    postal_code { '123-4567' }
    prefecture_id { 3 }
    municipality { '青山1-1' }
    phone_number { '09012345678' }
    address { '青山1-2' }
    token { 'tok_abcdefghijk00000000000000000' }
    item_id { 1 }
    user_id { 1 }
    building_name { '青山' }
  end
end
