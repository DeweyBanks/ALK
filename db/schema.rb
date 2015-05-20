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

ActiveRecord::Schema.define(version: 20150520170538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boys", force: true do |t|
    t.string  "name"
    t.integer "age"
  end

  create_table "courses", force: true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses_kids", id: false, force: true do |t|
    t.integer "kid_id",    null: false
    t.integer "course_id", null: false
  end

  add_index "courses_kids", ["course_id", "kid_id"], name: "index_courses_kids_on_course_id_and_kid_id", using: :btree
  add_index "courses_kids", ["kid_id", "course_id"], name: "index_courses_kids_on_kid_id_and_course_id", using: :btree

  create_table "kids", force: true do |t|
    t.string   "name",                                     null: false
    t.string   "email",                                    null: false
    t.integer  "grade"
    t.string   "classroom"
    t.date     "dob"
    t.string   "address"
    t.string   "apt"
    t.string   "city"
    t.string   "state",               default: "New York"
    t.integer  "zip"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "parent"
    t.string   "pickup"
    t.text     "allergies"
    t.integer  "user_id"
    t.string   "kids_file_name"
    t.string   "kids_content_type"
    t.integer  "kids_file_size"
    t.datetime "kids_updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "behavior_consent"
    t.string   "image_consent"
    t.string   "late_consent"
  end

  create_table "users", force: true do |t|
    t.string   "name",                                null: false
    t.string   "email",                               null: false
    t.string   "password_digest",                     null: false
    t.boolean  "admin",               default: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
