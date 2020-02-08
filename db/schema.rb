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

ActiveRecord::Schema.define(version: 2020_02_08_075453) do

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity"
    t.integer "order_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "warehouse_id"
    t.string "customer_name"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warehouse_id"], name: "index_orders_on_warehouse_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "sku"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sku"], name: "index_products_on_sku", unique: true
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "count"
    t.integer "product_id"
    t.integer "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_stocks_on_product_id"
    t.index ["warehouse_id"], name: "index_stocks_on_warehouse_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "province"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
