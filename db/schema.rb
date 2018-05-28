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

ActiveRecord::Schema.define(version: 20180522155705) do

  create_table "administrators", force: :cascade do |t|
    t.string "name"
    t.string "isteacher"
    t.string "password"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diplomas", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "isaprooved"
    t.string "type"
    t.string "group"
    t.string "studentid"
    t.string "teacherid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "teacherId"
    t.string "forGroup"
    t.string "isActive"
    t.string "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "desc"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "attachment_data"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "isActive"
    t.string "email"
    t.string "password"
    t.string "group"
    t.string "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "isonline"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "isActive"
    t.string "email"
    t.string "password"
    t.string "group"
    t.string "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "isonline"
  end

end
