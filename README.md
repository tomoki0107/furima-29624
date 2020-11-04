# テーブル設計

## users テーブル

| Column          | Type    | Options    | 
| --------------- | ------- | ---------- | 
| nickname        | string  | null:false | 
| email           | string  | null:false | 
| password        | string  | null:false | 
| last_name       | string  | null:false | 
| first_name      | string  | null:false | 
| last_name_kana  | string  | null:false | 
| first_name_kana | string  | null:false | 
| birth           | string  | null:false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column    | Type       | Options                      | 
| --------- | ---------- | ---------------------------- | 
| name      | string     | null:false                   | 
| image     | string     | null:false                   | 
| content   | string     | null:false                   | 
| category  | string     | null:false                   | 
| condition | string     | null:false                   | 
| burden    | string     | null:false                   | 
| area      | string     | null:false                   | 
| day       | string     | null:false                   | 
| price     | integer    | null:false                   | 
| user      | references | null:false, foreign_key:true |

### Association

- belongs_to :users
- has_one :purchases

## purchases テーブル

| Column | Type       | Options                      | 
| ------ | ---------- | ---------------------------- | 
| user   | references | null:false, foreign_key:true | 
| item   | references | null:false, foreign_key:true |

- belongs_to :users
- has_one :items
- has_one :deliveries

### Association

## deliveries テーブル

| Column       | Type       | Options                      | 
| ------------ | ---------- | ---------------------------- | 
| postal_code  | string     | null:false                   | 
| prefecture   | string     | null:false                   | 
| municipality | string     | null:false                   | 
| address      | string     | null:false                   | 
| building     | string     |                              | 
| phone_number | string     | null:false                   | 
| purchase     | references | null:false, foreign_key:true | 

### Association

- has_one :purchases