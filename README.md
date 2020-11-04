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
| birth           | date    | null:false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options                      | 
| ------------ | ---------- | ---------------------------- | 
| content      | string     | null:false                   | 
| category     | string     | null:false                   | 
| condition_id | integer    | null:false                   | 
| burden_id    | integer    | null:false                   | 
| area_id      | integer    | null:false                   | 
| day_id       | integer    | null:false                   | 
| price        | integer    | null:false                   | 
| user         | references | null:false, foreign_key:true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type       | Options                      | 
| ------ | ---------- | ---------------------------- | 
| user   | references | null:false, foreign_key:true | 
| item   | references | null:false, foreign_key:true |

- belongs_to :user
- has_one :item
- has_one :delivery

### Association

## deliveries テーブル

| Column        | Type       | Options                      | 
| ------------- | ---------- | ---------------------------- | 
| postal_code   | string     | null:false                   | 
| prefecture_id | integer    | null:false                   | 
| municipality  | string     | null:false                   | 
| address       | string     | null:false                   | 
| building      | string     |                              | 
| phone_number  | string     | null:false                   | 
| purchase      | references | null:false, foreign_key:true | 

### Association

- has_one :purchase