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
| birthday_year      | integer | null: false               |
| birthday_month     | integer | null: false               |
| birthday_date      | integer | null: false               |

- has_many :items
- has_many :buyers


itemsテーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| items_name  | string     | null: false |
| explanation | text       | null: false |
| category    | integer    | null: false |
| postage     | integer    | null: false |
| shipping    | integer    | null: false |
| days        | integer    | null: false |
| price       | integer    | null: false |
| users_id    | references |             |

- has_one :buyer
- belongs_to :user


buyerテーブル

| Column   | Type       | Options |
| -------- | ---------- | ------- |
| users_id | references |         |
| items_id | references |         |

- has_one    :shipping_add
- belongs_to :user
- belongs_to :item

shipping_addテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_number | string     | null: false |
| prefecture    | integer    | null: false |
| city          | integer    | null: false |
| address       | string     | null: false |
| building_name | string     |             |
| tel           | integer    | null: false |
| buyers_id     | references |             |

- belongs_to :buyer