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

ActiveRecord::Schema.define(version: 2021_04_12_003448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "celebrations", force: :cascade do |t|
    t.string "address"
    t.string "hour"
    t.string "date"
    t.bigint "marriage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marriage_id"], name: "index_celebrations_on_marriage_id"
  end

  create_table "ceremonies", force: :cascade do |t|
    t.string "address"
    t.string "hour"
    t.string "date"
    t.bigint "marriage_id"
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
    t.string "password_digest"
  end

  create_table "marriage_inviteds", force: :cascade do |t|
    t.bigint "marriage_id"
    t.bigint "invited_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "invited_confirm", default: false
    t.string "message_invited"
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
    t.string "password_digest"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "reservation_id"
    t.bigint "payment_method_id"
    t.string "state"
    t.decimal "total"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_method_id"], name: "index_payments_on_payment_method_id"
    t.index ["reservation_id"], name: "index_payments_on_reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "name1"
    t.string "name2"
    t.string "email_name1"
    t.string "email_name2"
    t.string "phone_name1"
    t.string "phone_name2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "total", default: 60.0
    t.boolean "payed", default: false
  end

  create_table "stars", force: :cascade do |t|
    t.integer "calification"
    t.string "message"
    t.bigint "marriage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marriage_id"], name: "index_stars_on_marriage_id"
  end

  create_table "template_invitations", force: :cascade do |t|
    t.string "image"
    t.bigint "marriage_id"
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

  add_foreign_key "celebrations", "marriages"
  add_foreign_key "ceremonies", "marriages"
  add_foreign_key "marriage_inviteds", "inviteds"
  add_foreign_key "marriage_inviteds", "marriages"
  add_foreign_key "payments", "payment_methods"
  add_foreign_key "payments", "reservations"
  add_foreign_key "stars", "marriages"
  add_foreign_key "template_invitations", "marriages"
end
