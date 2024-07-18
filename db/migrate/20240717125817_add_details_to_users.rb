class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :date_of_birth, :date

    VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/

    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'は有効なメールアドレスを入力してください' }

    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

    validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合で入力してください' }
    validates :password_confirmation, presence: true
    validates :password, confirmation: { case_sensitive: true }
  end
end