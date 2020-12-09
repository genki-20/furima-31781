class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :buys

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'が正しくありません' }
=======
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'が正しくありません' }
>>>>>>> 1f2f392482853f6c26417e0c653423e3b7ffcbae
  with_options presence: true do
    validates :nickname
    validates :last_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
<<<<<<< HEAD
    validates :last_name, format: { with: /\A[ァ-ヶー－]+\z/}
=======
    validates :last_name, format: { with: /\A[ァ-ヶー－]+\z/ }
>>>>>>> 1f2f392482853f6c26417e0c653423e3b7ffcbae
    validates :first_name, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
