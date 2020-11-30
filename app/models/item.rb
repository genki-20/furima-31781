class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :delivery_day
  has_one :buy

  with_options presence: true do
    validates :product_name
    validates :explanatory_name
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :area_id
    validates :delivery_day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, format: { with: /\A[0-9]+\z/ }, message: 'is out of setting range' }
    validates :image
  end

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :area_id
    validates :delivery_day_id
  end
end
