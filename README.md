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
| users         | references | foreign_key: true |

- has_one :buyer
- belongs_to :user


buyerテーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| users  | references | foreign_key: true |
| items  | references | foreign_key: true |

- has_one    :shipping_add
- belongs_to :user
- belongs_to :item

shipping_addテーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_number | string     | null: false       |
| city          | string     | null: false       |
| address       | string     | null: false       |
| building_name | string     |                   |
| tel           | integer    | null: false       |
| buyers        | references | foreign_key: true |

- belongs_to :buyer