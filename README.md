# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

### アプリ名
* ネットショップ サンプルサイト

### アプリの概要
* プログラミング学習のために個人で作成したECサイトです。
  商品をカートに入れ、購入する体験ができます。

### URL
* https://frozen-lake-44832.herokuapp.com/
* テストID:  test@test.com
* テストPW:  test1234

#### Ruby version  
2.5.1

#### Rails version
5.2.4.1

#### 制作背景
ECサイトの作成し、簡単な購入機能を再現してみたいと思ったため

#### 作成ポイント
* カートに商品を入れた時 → cartsテーブルのidを作成し、sessionに保存
                    orderitemsテーブルに商品を保存
* 注文が完了した時 → ordersテーブルに注文者の情報を保存
                orderitemsテーブルのoreder_idカラムに該当orderidを保存
                cartsテーブルのレコードを削除
* 様々なサイトを参考にさせていただきながら、プログラムを組み立てました。

## DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|address|string|
|telenumber|integer|
|email|string|null: false, unique: true|
|password|string|null: false|
|admin|boolean|default: false|
### Association
- has_many :orders

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|code|integer|unique: true|
|name|string|
### Association
- has_many :items

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|code|string|null: false, unique: true|
|name|string|null: false|
|image|string|
|price|integer|null: false|
|taxrate|integer|
|category|references|foreign_key: true|
### Association
- belongs_to :category
- has_many :orderitems

## cartsテーブル
商品をカートに入れると一時的にidを作成、注文完了時にidは削除される

## oderitemsテーブル
|Column|Type|Options|
|------|----|-------|
|itemcode|string|
|itemname|string|
|itemprice|integer|
|quantity|integer|
|cart_id|integer|
|item|references|foreign_key: true|
|order|references|foreign_key: true|
### Association
- belongs_to :item
- belongs_to :cart 
- belongs_to :order

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|username|string|
|orderitems|string|
|user|references|foreign_key: true|
### Association
- has_many :orderitem, dependent: :destroy
- belongs_to :user