# README

## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| kana_last_name     | string  | null: false               |
| kana_first_name    | string  | null: false               |
| nickname           | string  | null: false               |
| email              | string  | null: false               |
| encrypted_password | string  | null: false, unique: true |
| year_of_birth      | integer | null: false               |
| month_of_birth     | integer | null: false               |
| day_of_birth       | integer | null: false               |

### Association
- has_many :items
- has_many :users_orders



## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| price            | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false |
| fee_id           | integer    | null: false |
| prefecture_id    | integer    | null: false |
| delivery_days_id | integer    | null: false |
| users_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| tel           | string     | null: false                    |
| postal_code   | string     | null: false                    |
| city          | string     | null: false                    |
| address1      | string     | null: false                    |
| address2      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| orders_id     | references | null: false, foreign_key: true |


### Association
- has_many :orders



## ordersテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| items_id     | references | null: false, foreign_key: true |
| users_id     | references | null: false, foreign_key: true |

### Association
- has_many :users_orders
- belongs_to :address
- belongs_to :item



## users_ordersテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| orders_id | references | null: false, foreign_key: true |

### Association
- belongs_to :order
- belongs_to :user


