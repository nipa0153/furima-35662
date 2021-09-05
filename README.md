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

- has_one    :shipping_add
- belongs_to :users
- belongs_to :items

shipping_addテーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| postal_number | string | null: false |
| city          | string | null: false |
| address       | string | null: false |
| building_name | string |             |
| tel           | string | null: false |

- belongs_to :buyer