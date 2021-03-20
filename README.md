## userテーブ
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname     | string | null: false |
| email    | string | null: false |
| encrypted_password | string | null: false |
| last_name_kanji| string | null:false |
| first_name_kanji | string | null:false |
| last_name | string | null:false |
| first_name | string | null:false |
| birthday | date | null:false |
- has_many :items
- has_many :buys

## item テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| product_name   | string | null:false |
| explanatory＿name|text | null:false |
| category_id| integer | null:false |
| status_id| integer | null:false |
| delivery＿fee_id |integer | null:false |
| area_id| integer | null:false |
| days_id|integer | null:false |
| price|integer | null:false |
| user   | references | null: false, foreign_key: true |
- belongs_to :user
- has_one :buy

## buy
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
- belongs_to :item
- belongs_to :user
- has_many :street_address

## street_address
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| postal_code | string | null: false |
| prefectures_id| integer | null: false |
| municipality | string | null: false |
| address| string | null: false |
| building_name|
| phone_number |string | null:false |
| buy   | references | null: false, foreign_key: true |
- belongs_to :buy