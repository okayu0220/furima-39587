# README

## テーブル設計

## usersテーブル
| column             | type   | option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name_fw      | string | null: false               |
| last_name_fw       | string | null: false               |
| first_name_kn      | string | null: false               |
| last_name_kn       | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :orders


## itemsテーブル
| column               | type       | option                         |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| info                 | text       | null: false                    |
| category_id          | integer    | null: false                    |
| item_status_id       | integer    | null: false                    |
| fee_status_id        | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| delivery_schedule_id | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- has_one :order
- ActiveStorageでimage添付
- Active_Hashを使用: category_id, item_status_id, fee_status_id, prefecture_id, delivery_schedule_id


## ordersテーブル
| column | type       | option                         |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :delivery


## deliveriesテーブル
| column         | type       | option                         |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipalities | string     | null: false                    |
| house_number   | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |


### Association
- belongs_to :order
- Active_Hashを使用: prefecture_id