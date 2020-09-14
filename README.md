# アプリケーション概要

フリーマーケットのアプリケーションを作成しました。
接続先
https://furima-28352.herokuapp.com/

ID/Pass
ID: admin
Pass: 2222

テスト用アカウント等

購入者用メールアドレス:

testtest@test.test

パスワード: 

testtest

購入用カード情報

番号：4242424242424242

期限：Wed Jan 22 2020 00:00:00 GMT+0900 (日本標準時)

セキュリティコード：111

出品者用メールアドレス: 

tarou@aa.aa

パスワード: tennis57

開発状況
開発環境
Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code

開発期間と平均作業時間
開発期間：8/5~8/28(23日間)

1日あたりの平均作業時間：6時間

合計：150時間程度

動作確認方法
WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
接続先およびログイン情報については、上記の通りです。
同時に複数の方がログインしている場合に、ログインできない可能性があります。
テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品

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


