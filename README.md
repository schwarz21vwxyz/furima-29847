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
| name     | string | null: false |
| name_show| string | null: false |
| birthday | integer| null: false |

### Association

- has_many :items





## items テーブル

| column | Type  |   Options   |
| ------ | ----- | ----------- |
|  name  |string | null: false |
|comment | text  | null: false |
|category|integer| null: false |
|  show  |integer| null: false |
|delivery|integer| null: false |
|  area  |integer| null: false |
|  days  |integer| null: false |
|  price |integer| null: false |
| user_id| references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order






##  order  テーブル

|  Column     |   Type     |      Options       |
| ----------- | ---------- | -------------------|
|  user_id    | references | foreign_key: true  |
|  item_id    | references | foreign_key: true  |
| postal_code |  string    |   null: false      |
| prefecture  |  integer   |   null: false      |
|    city     |  string    |   null: false      |
|house_number |  string    |   null: false      |
|building_name|  string    |                    |
|phone_number |  string    |   null: false      |

### Association

belongs_to :user
belongs_to :items