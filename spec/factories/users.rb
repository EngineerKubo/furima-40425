FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { 'password1' } # 半角英数字混合のパスワードを指定
    password_confirmation { password }
    last_name             { '山田' } # 全角文字（漢字・ひらがな・カタカナ）
    first_name            { '太郎' } # 全角文字（漢字・ひらがな・カタカナ）
    last_name_kana        { 'ヤマダ' } # 全角カタカナ
    first_name_kana       { 'タロウ' } # 全角カタカナ
    date_of_birth         { '1990-01-01' } # 任意の日付
  end
end