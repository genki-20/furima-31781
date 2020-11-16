## userテーブ
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname     | string | null: false |
| email    | string | null: false |
| encrypted_password | string | null: false |
| name | string | null:false |
| birthday | date | null:false |
- has_many :items
- has_many :buys

## item テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| product＿name   | string | null:false |
| explanatory＿name|string | null:false |
| category| integer | null:false |
| status| integer | null:false |
| delivery＿fee |integer | null:false |
| area| integer | null:false |
| days|integer | null:false |
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
| prefectures| integer | null: false |
| municipality | string | null: false |
| address| string | null: false |
| building_name|
| phone_number |string | null:false |

- belongs_to :buy







## comment
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |
| text        | text       | null: false       |
### Association
- belongs_to :item
- belongs_to :user
