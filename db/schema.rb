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

ActiveRecord::Schema.define(version: 2023_06_12_025142) do

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.integer "status", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "daily_notes", charset: "utf8mb4", force: :cascade do |t|
    t.text "content", null: false
    t.date "recorded_on", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "recorded_on"], name: "idx_daily_note_unique", unique: true
    t.index ["user_id"], name: "index_daily_notes_on_user_id"
  end

  create_table "exercises", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.integer "status", default: 1, null: false
    t.bigint "category_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_exercises_on_category_id"
    t.index ["user_id"], name: "index_exercises_on_user_id"
  end

  create_table "notes", charset: "utf8mb4", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "resource_id", null: false
    t.string "resource_kind", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resource_kind", "resource_id"], name: "idx_note_unique", unique: true
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "record_tags", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "record_id"
    t.bigint "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_id"], name: "index_record_tags_on_record_id"
    t.index ["tag_id"], name: "index_record_tags_on_tag_id"
  end

  create_table "records", charset: "utf8mb4", force: :cascade do |t|
    t.integer "weight"
    t.integer "rep"
    t.date "executed_on", null: false
    t.bigint "exercise_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_records_on_exercise_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "tags", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "user_profiles", charset: "utf8mb4", force: :cascade do |t|
    t.string "email"
    t.string "display_name"
    t.string "phone_number"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "uid", limit: 48, null: false
    t.integer "authentication_type", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
