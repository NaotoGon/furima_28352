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
- has_many :items

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name  | string | null: false |
| image | string | null: false |
| price | integer | null: false |
| text | string | null: false |
| user_id | references | null: false, foreign_key: true |
| category | integer | null: false |
| status | integer | null: false |
| ship_fee | integer | null: false |
| prefecture | integer | null: false |
| during | integer | null: false |

### Association
- has_one :address
- belongs_to :users

## ship_address テーブル

| Column  | Type    | Options                        |
| ------- |  -------| ------------------------------ |
| postal_code | string  | null: false                |
| prefecture | integer | null: false                 |
| city | string  | null: false                       |
| house_number | string  | null: false               |
| building_name | string  |                          |
| phone_number | string  | null: false               |
| item_id | references | null: false, foreign_key: true |


### Association

- belongs_to :items