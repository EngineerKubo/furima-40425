class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :last_name, :string
    add_column :users, :fast_name, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :fast_name_kana, :string
    add_column :users, :date_of_birth, :date
  end
end