class Buy < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_many :street_address
end
