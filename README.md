# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nick_name| string | null: false |
| email    | string | null: false |
| password | string | null: false |
|family_name|string | null: false |
| name     | string | null: false |
|family_name_show| integer| null: false |
| name_show| string | null: false |
| birthday |  date  | null: false |

### Association

- has_many :items
- has_many :orders
- has_one :address



## items テーブル

| column    | Type  |   Options   |
| --------- | ----- | ----------- |
|  name     |string | null: false |
|comment    | text  | null: false |
|category_id|integer| null: false |
|  show_id  |integer| null: false |
|delivery_id|integer| null: false |
|  area_id  |integer| null: false |
|  days_id  |integer| null: false |
|  price    |integer| null: false |
|  user     | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order






##  order  テーブル

|  Column     |   Type     |      Options       |
| ----------- | ---------- | -------------------|
|    user     | references | foreign_key: true  |
|    item     | references | foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :items
- belongs_to :address




## address テーブル

|   Column    |  Type      |     Options        |
| ----------- | ---------- | ------------------ |
| postal_code |  string    |   null: false      |
|prefecture_id|  integer   |   null: false      |
|    city     |  string    |   null: false      |
|house_number |  string    |   null: false      |
|building_name|  string    |                    |
|phone_number |  string    |   null: false      |

### Association

- belongs_to :users
- belongs_to :orders