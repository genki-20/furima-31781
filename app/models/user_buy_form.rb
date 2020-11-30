class UserBuyForm
  include ActiveModel::Model

  attr_accessor :token, :item_id, :product_name, :nickname, :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :address, :phone_number, :user_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid.' }
    validates :prefecture_id
    validates :municipality
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'is invalid.' }, length: { maximum: 11 }
    validates :address
    validates :item_id
    validates :user_id
  end
  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :prefecture_id
  end

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    StreetAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, building_name: building_name, address: address, phone_number: phone_number)
  end
end
