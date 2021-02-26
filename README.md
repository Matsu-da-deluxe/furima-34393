# テーブル設計

## user テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| f_name             | string | null: false |
| l_name             | string | null: false |
| f_name_kana        | string | null: false |
| l_name_kana        | string | null: false |
| birthday           | date   | null: false |
|                    |        |             |



### Association

- has_many :items
- has_many :buyer

## items テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| image       |            | null: false                   |
| name        | string     | null: false                   |
| description | text       | null: false                   |
| category_id | integer    | null: false                   |
| status_id   | integer    | null: false                   |
| ship_fee_id | integer    | null: false                   |
| area_id     | integer    | null: false                   |
| city        | string     | null: false                   |
| date_id     | integer    | null: false                   |
| price       | integer    | null: false                   |
| user        | references | null:false, foreign_key: true |
|             |            | null: false                   |

### Association

- has_one :buyer
- belongs_to :users

## buyer テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | string     | null: false, foreign_key: true |
| item_id   | string     | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :items
- has_many :address

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| area          | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_num     | integer    | null: false                    |
| buyer_id      | references | null: false, foreign_key: true |
|               |            |                                |

### Association

- belongs_to :buyer