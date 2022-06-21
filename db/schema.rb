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

ActiveRecord::Schema.define(version: 2022_06_21_075407) do

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "events", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "order"
    t.integer "general_order"
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "options", charset: "utf8mb4", force: :cascade do |t|
    t.string "background_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "records", charset: "utf8mb4", force: :cascade do |t|
    t.decimal "volume", precision: 10
    t.text "note"
    t.date "recorded_on"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_records_on_event_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "tags", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "tags_training_sets", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "training_set_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tag_id"], name: "index_tags_training_sets_on_tag_id"
    t.index ["training_set_id"], name: "index_tags_training_sets_on_training_set_id"
  end

  create_table "targets", charset: "utf8mb4", force: :cascade do |t|
    t.integer "monthly_target_volume"
    t.integer "monthly_target_days"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_targets_on_user_id"
  end

  create_table "training_sets", charset: "utf8mb4", force: :cascade do |t|
    t.integer "sets"
    t.integer "reps"
    t.decimal "volume", precision: 10
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "fb_uid", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
