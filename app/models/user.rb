class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :password, format: {with: /\A[a-zA-Z0-9]+\z/,message: "パスワードが正しくありません"}
  with_options presence: true do
    validates :nickname
    validates :last_name_kanji, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "ユーザー本名が正しくありません"}
    validates :first_name_kanji, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "ユーザー本名が正しくありません"}
    validates :last_name,format: {with: /\A[ァ-ヶー－]+\z/, message: "フリガナが正しくありません"}
    validates :first_name, format: {with: /\A[ァ-ヶー－]+\z/, message: "フリガナが正しくありません"}
    validates :birthday
  end
end 