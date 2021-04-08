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

ActiveRecord::Schema.define(version: 2021_04_08_024700) do

  create_table "celebrations", force: :cascade do |t|
    t.string "address"
    t.string "hour"
    t.string "date"
    t.integer "marriage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marriage_id"], name: "index_celebrations_on_marriage_id"
  end

  create_table "ceremonies", force: :cascade do |t|
    t.string "address"
    t.string "hour"
    t.string "date"
    t.integer "marriage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marriage_id"], name: "index_ceremonies_on_marriage_id"
  end

  create_table "inviteds", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "marriage_inviteds", force: :cascade do |t|
    t.integer "marriage_id"
    t.integer "invited_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invited_id"], name: "index_marriage_inviteds_on_invited_id"
    t.index ["marriage_id"], name: "index_marriage_inviteds_on_marriage_id"
  end

  create_table "marriages", force: :cascade do |t|
    t.string "name1"
    t.string "name2"
    t.string "phone_name1"
    t.string "phone_name2"
    t.string "email_name1"
    t.string "email_name2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link_gift"
    t.string "code_gift"
    t.string "enterprise_gift"
    t.string "password"
  end

  create_table "template_invitations", force: :cascade do |t|
    t.string "image"
    t.integer "marriage_id"
    t.string "message_personalized"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marriage_id"], name: "index_template_invitations_on_marriage_id"
  end

  create_table "tutorials", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
