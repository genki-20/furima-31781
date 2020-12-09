class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :buys

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'が正しくありません' }
  with_options presence: true do
    validates :nickname
    validates :last_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :first_name, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
