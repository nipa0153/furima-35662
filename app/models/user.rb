class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: "is invalid. Input including both alphabets and numbers."
  
    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."} do
      validates :last_name
      validates :first_name
    end

    with_options format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input fullwidth katakana characters."} do
      validates :last_kana
      validates :first_kana
    end
  end

  has_many :items
  has_many :buyers  
end
