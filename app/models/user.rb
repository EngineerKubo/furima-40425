class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
         VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
         VALID_NAME_KANA_REGEX = /\A[ァ-ヶー]+\z/
         validates :nickname, presence: true
         validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合で入力してください' }, confirmation: true
         validates :last_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'は全角文字（漢字・ひらがな・カタカナ）で入力してください' }
         validates :first_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'は全角文字（漢字・ひらがな・カタカナ）で入力してください' }
         validates :last_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX, message: 'は全角カタカナで入力してください' }
         validates :first_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX, message: 'は全角カタカナで入力してください' }
         validates :date_of_birth, presence: true
         has_many :products
end