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
- has_many :orders



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
| user            | references | null: false, foreign_key: true |

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
| building      | string     |                                |
| prefecture_id | integer    | null: false                    |
| order        | references | null: false, foreign_key: true |


### Association
- belongs_to :order



## ordersテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :address
- belongs_to :item



