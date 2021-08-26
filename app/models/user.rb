class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: '半角英数字を使用してください'}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）を使用してください'} 
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）を使用してください'}
  validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナを使用してください'}
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナを使用してください'}
  validates :date_of_birth, presence: true
end
