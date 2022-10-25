# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_10_25_023856) do

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.text "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "daily_records", charset: "utf8mb4", force: :cascade do |t|
    t.text "memo"
    t.date "recorded_on", null: false
    t.text "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recorded_on"], name: "index_daily_records_on_recorded_on", unique: true
  end

  create_table "events", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.integer "order"
    t.integer "general_order"
    t.text "user_id", null: false
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_events_on_category_id"
  end

  create_table "records", charset: "utf8mb4", force: :cascade do |t|
    t.text "memo"
    t.integer "volume"
    t.date "recorded_on", null: false
    t.bigint "event_id"
    t.bigint "daily_record_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["daily_record_id"], name: "index_records_on_daily_record_id"
    t.index ["event_id"], name: "index_records_on_event_id"
  end

  create_table "tags", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "color_name", null: false
    t.text "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "targets", charset: "utf8mb4", force: :cascade do |t|
    t.integer "monthly_target_volume"
    t.integer "monthly_target_days"
    t.text "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "training_set_tags", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "training_set_id"
    t.bigint "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "training_sets", charset: "utf8mb4", force: :cascade do |t|
    t.integer "weight"
    t.integer "reps"
    t.integer "volume"
    t.text "memo"
    t.bigint "record_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_id"], name: "index_training_sets_on_record_id"
  end

end
