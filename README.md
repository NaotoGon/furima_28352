# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| name     | string | null: false |
| name_reading | string | null: false |
| fam_name     | string | null: false |
| fam_name_reading | string | null: false |
| birthday | date | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :items, orders

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name  | string | null: false |
| image | string | null: false |
| price | integer | null: false |
| text | string | null: false |
| user | references | null: false, foreign_key: true |
| category_id | integer | null: false |
| status_id | integer | null: false |
| ship_fee_id | integer | null: false |
| region_id | integer | null: false |
| during_id | integer | null: false |

### Association
- has_one :ship_address, order
- belongs_to :user

## ship_addresses テーブル

| Column  | Type    | Options                        |
| ------- |  -------| ------------------------------ |
| postal_code | string | null: false                |
| prefecture | integer | null: false                 |
| city | string  | null: false                       |
| house_number | string  | null: false               |
| building_name | string  |                          |
| phone_number | string  | null: false               |
| item | references | null: false, foreign_key: true |
| user | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## orders テーブル

| Column  | Type    | Options                        |
| ------- |  -------| ------------------------------ |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |


### Association

- belongs_to :item, user


