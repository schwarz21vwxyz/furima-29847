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
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :item
- has_one :purchase





## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
|item_name| string| null: false |
| image  | text   | null: false |
| setumei| text   | null: false |
| price  | integer| null: false |
|user_id | integer| null: false |

### Association

- has_one :user
- has_one :purchase





## purchase テーブル

|  Column     |   Type     | Options                        |
| ----------- | ---------- | ------------------------------ |
|   name      |  string    |         null: false            |
|  price      |  integer   |         null: false            |
|postal_code  |  integer   |         null: false            |
|    city     |  string    |         null: false            |
|house_number |  integer   |         null: false            |
|building_name|  string    |         null: false            |
|   user_id   |  integer   |         null: false            |

### Association

- has_one :item
- has_one :user