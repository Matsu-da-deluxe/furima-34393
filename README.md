# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| f_name             | string | null: false               |
| l_name             | string | null: false               |
| f_name_kana        | string | null: false               |
| l_name_kana        | string | null: false               |
| birthday           | date   | null: false               |
|                    |        |                           |


### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| name        | string     | null: false                   |
| description | text       | null: false                   |
| category_id | integer    | null: false                   |
| status_id   | integer    | null: false                   |
| ship_fee_id | integer    | null: false                   |
| area_id     | integer    | null: false                   |
| day_id      | integer    | null: false                   |
| price       | integer    | null: false                   |
| user        | references | null:false, foreign_key: true |
|             |            |                               |


### Association

- has_one :buyer
- belongs_to :user

## buyers テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| area_id       | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_num     | string     | null: false                    |
| buyer         | references | null: false, foreign_key: true |
|               |            |                                |

### Association

- belongs_to :buyer