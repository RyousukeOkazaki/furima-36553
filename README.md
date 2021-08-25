# README

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| sex                | string | null: false               |
| age                | string | null: false               |
| nickname           | string | null: false               |
| email              | string | null: false               |
| encrypted_password | string | null: false, unique: true |

### Association
- has_many :items
- has_one :address
- has_many :users_orders



## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| price         | integer    | null: false                    |
| category      | string     | null: false                    |
| owner         | string     | null: false                    |
| image         | 
| status        | string     | null: false |
| fee           | integer    | null: false |
| prefecture    | string     | null: false |
| delivery_days | integer    | null: false |
| orders_id     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## addressesテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| tel         | integer    | null: false                    |
| postal_code | integer    | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| address1    | string     | null: false                    |
| address2    | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_many :addresses_orders



## ordersテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| owner        | string     | null: false                    |
| buyer        | string     | null: false                    |
| items_id     | references | null: false, foreign_key: true |
| addresses_id | references | null: false, foreign_key: true |

### Association
- has_many :users_orders
- has_many :addresses_orders
- belongs_to :item



## users_ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| items_id | references | null: false, foreign_key: true |

### Association
- belongs_to :order
- belongs_to :user


## addresses_ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| addresses_id | references | null: false, foreign_key: true |
| orders_id    | references | null: false, foreign_key: true |

### Association
- belongs_to :address
- belongs_to :order