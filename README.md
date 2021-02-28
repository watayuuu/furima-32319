# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :items
- has_one :delivery

## purchase_managementテーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| user_id         |           |                                |
| item_id         |           |                                |

### Association

- belongs_to :item
- belongs_to :user

## items テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| product_name    | string    | null: false                    |
| commentary      | text      | null: false                    |
| category_id     | integer   | null: false                    |
| status_id       | integer   | null: false                    |
| fee_id          | integer   | null: false                    |
| area_id         | integer   | null: false                    |
| days_id         | integer   | null: false                    |
| price           | string    | null: false                    |
| user            |references | null: false, foreign_key: true |

### Association

- has_one :purchase_management
- has_one :delivery


## delivery テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| area_id         | integer    | null: false                    |
| city            | string     | null: false                    |
| street          | string     | null: false                    |
| building_name   | string     |                                |
| phone           | string     | null: false                    |

### Association

- belongs_to :item
