class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname, presence: true
         validates :date_of_birth, presence: true

         validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'は有効なメールアドレスを入力してください' }
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

         validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合で入力してください' }
         validates :password_confirmation, presence: true
         validates :password, confirmation: { case_sensitive: true }

         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/, message: 'は全角文字（漢字・ひらがな・カタカナ）で入力してください' }
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/, message: 'は全角文字（漢字・ひらがな・カタカナ）で入力してください' }

         validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カタカナで入力してください' }
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カタカナで入力してください' }
end
end