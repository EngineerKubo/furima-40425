# DB 設計

## users table

| Column             | Type   | Options                                 |
| ------------------ | ------ | --------------------------------------- |
| nickname           | string | null: false                             |
| email              | string | null: false, unique: true, unique: true |
| encrypted_password | string | null: false                             |
| last_name          | string | null: false                             |
| fast_name          | string | null: false                             |
| last_name_kana     | string | null: false                             |
| fast_name_kana     | string | null: false                             |
| date_of_birth      | date   | null: false                             |

### Association

- has_many :products
- has_many :orders

## products table

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| product_name        | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| shipping_charge_id  | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| days_to_shipping_id | integer    | null: false                    |
| price               | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :shipping_address

## shipping_addresses table

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| order            | references | null: false, foreign_key: true |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipality     | string     | null: false                    |
| street_address   | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |

### Association

- belongs_to :order
