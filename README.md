## userテーブ
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name | string | null:false |
| birthday | integer | null:false |
- has_many :item
- has_many :buy

## item テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| product name   | string | null:false |
| explanatory name|string | null:false |
| image |string | null:false |
| category| string | null:false |
| status| text | null:false |
| delivery fee |integer | null:false |
| area| text | null:false |
| days|integer | null:false |
| price|integer | null:false |
| user   | references | null: false, foreign_key: true |
- belongs_to :user
- has_many :buy
## buy
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| card information|integer | null:false |
| expiration date|integer | null:false |
| security code|integer | null:false |
| postal code | string | null: false |
| prefectures| string | null: false |
| municipality | string | null: false |
| address| string | null: false |
| building name| string | null: false |
| phone number |integer | null:false |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
- belongs_to :item
- belongs_to :user







## comment
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |
| text        | text       | null: false       |
### Association
- belongs_to :item
- belongs_to :user
