テーブル設計

usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_kana          | string  | null: false               |
| first_kana         | string  | null: false               |
| birthday           | date    | null: false               |

- has_many :items
- has_many :buyers


itemsテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| items_name    | string     | null: false       |
| explanation   | text       | null: false       |
| category_id   | integer    | null: false       |
| condition_id  | integer    | null: false       |
| postage_id    | integer    | null: false       |
| prefecture_id | integer    | null: false       |
| days_id       | integer    | null: false       |
| price         | integer    | null: false       |
| user          | references | foreign_key: true |

- has_one :buyer
- belongs_to :user


buyersテーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| user             | references | foreign_key: true |
| item             | references | foreign_key: true |

- has_one    :shipping_add
- belongs_to :user
- belongs_to :item

shipping_addsテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_number | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| address       | string     | null: false       |
| building_name | string     |                   |
| tel           | string     | null: false       |
| buyer         | references | foreign_key: true |

- belongs_to :buyer