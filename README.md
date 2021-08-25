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
| date_of_birth      | date    | null: false               |

### Association
- has_many :items
- has_many :users_orders



## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| price            | integer    | null: false                    |
| category         | integer    | null: false                    |
| status           | integer    | null: false |
| fee              | integer    | null: false |
| prefecture       | integer    | null: false |
| delivery_days    | integer    | null: false |
| users            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| tel           | string     | null: false                    |
| postal_code   | string     | null: false                    |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building      | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| orders        | references | null: false, foreign_key: true |


### Association
- has_one :order



## ordersテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| items        | references | null: false, foreign_key: true |
| users        | references | null: false, foreign_key: true |

### Association
- has_many :users_orders
- belongs_to :address
- belongs_to :item



## users_ordersテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| orders    | references | null: false, foreign_key: true |

### Association
- belongs_to :order
- belongs_to :user


