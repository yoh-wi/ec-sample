# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_01_082225) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "categorynumber"
    t.string "category"
    t.integer "code"
    t.string "name", null: false
    t.string "image"
    t.integer "price", null: false
    t.integer "taxrate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "orderitems", force: :cascade do |t|
    t.integer "itemcatecode"
    t.string "itemcatename"
    t.integer "itemcode"
    t.string "itemname"
    t.integer "itemprice"
    t.integer "quantity"
    t.integer "item_id"
    t.integer "cart_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_orderitems_on_cart_id"
    t.index ["item_id"], name: "index_orderitems_on_item_id"
    t.index ["order_id"], name: "index_orderitems_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "username"
    t.string "orderitems"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orderitems"], name: "index_orders_on_orderitems"
  end

end
