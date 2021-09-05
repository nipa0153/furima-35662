<!-- # README

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

* ... -->

テーブル設計

usersテーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| nickname    | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |
| name        | string  | null: false |
| kana_name   | string  | null: false |

- has_many :items
- has_many :buyer

itemsテーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| items_name  | string | null: false |
| explanation | text   | null: false |
| price       | string | null: false |

- has_one :buyer
- belongs_to :user

buyerテーブル

| Column   | Type | Options |
| -------- | ---- | ------- |
|          |      |         |

- has_one    :delivered_add
- belongs_to :users
- belongs_to :items

delivered_addテーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| postal_num    | string | null: false |
| city          | string | null: false |
| address       | string | null: false |
| building_name | string |             |

- belongs_to :buyer