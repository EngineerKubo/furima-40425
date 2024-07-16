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
- has_many :order_history

## products table

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| users            | references | null: false, foreign_key: true |
| product_name     | string     | null: false                    |
| description      | text       | null: false                    |
| category         | string     | null: false                    |
| condition        | string     | null: false                    |
| shipping_charge  | string     | null: false                    |
| ship_from        | string     | null: false                    |
| days_to_shipping | string     | null: false                    |
| price            | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order_history

## order_histories table

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| users    | references | null: false, foreign_key: true |
| products | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :shipping_information

## shipping_addresses table

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| order_histories  | references | null: false, foreign_key: true |
| post_code        | string     | null: false                    |
| prefecture       | string     | null: false                    |
| municipality     | string     | null: false                    |
| street_address   | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |

### Association

- belongs_to :order_history
