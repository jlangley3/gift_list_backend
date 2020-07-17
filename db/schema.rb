# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_17_020615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contact_interests", force: :cascade do |t|
    t.bigint "contact_id", null: false
    t.bigint "interest_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_contact_interests_on_contact_id"
    t.index ["interest_id"], name: "index_contact_interests_on_interest_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.datetime "birthday"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "date"
    t.float "budget"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "gifts", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.boolean "given", default: true
    t.integer "rating", default: 0
    t.string "link"
    t.bigint "event_id"
    t.bigint "contact_id" 
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_gifts_on_contact_id"
    t.index ["event_id"], name: "index_gifts_on_event_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reminders", force: :cascade do |t|
    t.string "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "repeating", default: true
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_reminders_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "avatar", default: "https://i.pinimg.com/originals/49/60/32/496032fb38b76e5bc22f8eb1d4a5d9be.jpg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "contact_interests", "contacts"
  add_foreign_key "contact_interests", "interests"
  add_foreign_key "contacts", "users"
  add_foreign_key "events", "users"
  add_foreign_key "gifts", "contacts"
  add_foreign_key "gifts", "events"
  add_foreign_key "reminders", "events"
end
