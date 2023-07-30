# README

## テーブル設計

## usersテーブル
| column             | type   | option      |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association
- has_one :profile
- has_many :items
- has_many :orders


## profilesテーブル
| column             | type       | option                         |
| ------------------ | ---------- | ------------------------------ |
| first_name_fw      | string     | null: false                    |
| last_name_fw       | string     | null: false                    |
| first_name_kn      | string     | null: false                    |
| last_name_kn       | string     | null: false                    |
| birthday_y         | integer    | null: false                    |
| birthday_m         | integer    | null: false                    |
| birthday_d         | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## itemsテーブル
| column             | type       | option                         |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| info               | string     | null: false                    |
| category           | string     | null: false                    |
| item_status        | string     | null: false                    |
| fee_status         | string     | null: false                    |
| prefecture         | string     | null: false                    |
| delivery_schedule  | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- has_one :order
- ActiveStorageでimage添付


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
| prefecture     | string     | null: false                    |
| municipalities | string     | null: false                    |
| house_number   | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |


### Association
- belongs_to :order
