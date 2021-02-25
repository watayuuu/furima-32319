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

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| year            | string | null: false |
| month           | string | null: false |
| day             | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| product_name    | text      | null: false                    |
| commentary      | text      | null: false                    |
| category        | string    | null: false                    |
| status          | string    | null: false                    |
| fee             | string    | null: false                    |
| area            | string    | null: false                    |
| days            | string    | null: false                    |
| price           | string    | null: false                    |
| user            |references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | string     | null: false                    |
| deadline        | string     | null: false                    |
| valid_month     | string     | null: false                    |
| valid_year      | string     | null: false                    |
| postal_code     | string     | null: false                    |
| region          | string     | null: false                    |
| city            | string     | null: false                    |
| street          | string     | null: false                    |
| building_name   | string     |                                |
| phone           | string     | null: false                    |
| item            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user