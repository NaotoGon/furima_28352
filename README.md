# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| name     | string | null: false |
| readname | string | null: false |
| birthday | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :items

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name  | string | null: false |
| image | string | null: false |
| price | string | null: false |
| text | string | null: false |
| user_id | references | null: false, foreign_key: true |
| category | string | null: false |
| status | string | null: false |
| shipfee | string | null: false |
| prefecture | string | null: false |
| during | string | null: false |

### Association
- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## address テーブル

| Column  | Type    | Options                        |
| ------- |  -------| ------------------------------ |
| postal_code | string  | null: false                |
| prefecture | string  | null: false                 |
| city | string  | null: false                       |
| house_number | string  | null: false               |
| building_name | string  |                          |
| phone_number | string  | null: false               |

### Association

- belongs_to :room
- belongs_to :user