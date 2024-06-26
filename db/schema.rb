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

ActiveRecord::Schema[7.1].define(version: 2024_04_20_155836) do
  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "cost"
    t.integer "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_items_on_room_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.integer "budget"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_budget"
    t.string "status"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.integer "cost"
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["project_id"], name: "index_rooms_on_project_id"
  end

  create_table "snapshots", force: :cascade do |t|
    t.datetime "date"
    t.integer "total_cost"
    t.json "daily_changes"
    t.integer "project_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_snapshots_on_project_id"
    t.index ["room_id"], name: "index_snapshots_on_room_id"
  end

  add_foreign_key "items", "rooms"
  add_foreign_key "rooms", "projects"
  add_foreign_key "snapshots", "projects"
  add_foreign_key "snapshots", "rooms"
end
