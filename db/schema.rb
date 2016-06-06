# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160606041418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cut_offs", force: :cascade do |t|
    t.string  "college_name",                             null: false
    t.integer "college_code",                             null: false
    t.string  "branch_name",                              null: false
    t.integer "branch_code",                              null: false
    t.string  "category_name",                            null: false
    t.integer "rank",                                     null: false
    t.decimal "composite_score", precision: 17, scale: 2, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name",                    null: false
    t.string   "father_name"
    t.string   "surname",                       null: false
    t.string   "mother_name",                   null: false
    t.datetime "date_of_birth",                 null: false
    t.integer  "rank",                          null: false
    t.decimal  "composite_score",               null: false
    t.string   "category",                      null: false
    t.string   "home_university"
    t.string   "contact_no"
    t.string   "father_contact_no"
    t.string   "email"
    t.text     "address"
    t.string   "cet_exam_number"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "gender",            default: 0, null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "type",                   default: "Student", null: false
    t.integer  "created_by",             default: -1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
