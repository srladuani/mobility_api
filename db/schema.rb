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

ActiveRecord::Schema.define(version: 20150629021351) do

  create_table "Conference_Specialities", force: :cascade do |t|
    t.integer "conference_id",   limit: 4, null: false
    t.integer "specialities_id", limit: 4, null: false
  end

  add_index "Conference_Specialities", ["conference_id"], name: "conference_id", using: :btree
  add_index "Conference_Specialities", ["specialities_id"], name: "specialities_id", using: :btree

  create_table "Conferences", force: :cascade do |t|
    t.integer "topic_id",          limit: 4,   null: false
    t.date    "start_date",                    null: false
    t.date    "end_date",                      null: false
    t.string  "location",          limit: 200, null: false
    t.integer "organizer_id",      limit: 4,   null: false
    t.integer "conference_status", limit: 4,   null: false
  end

  add_index "Conferences", ["organizer_id"], name: "organizer_id", using: :btree
  add_index "Conferences", ["topic_id"], name: "topic_id", using: :btree

  create_table "Invitation", force: :cascade do |t|
    t.integer "conference_id", limit: 4, null: false
    t.integer "moderator_id",  limit: 4, null: false
    t.integer "doctor_id",     limit: 4, null: false
    t.integer "status",        limit: 4, null: false
  end

  add_index "Invitation", ["conference_id"], name: "conference_id", using: :btree
  add_index "Invitation", ["doctor_id"], name: "doctor_id", using: :btree
  add_index "Invitation", ["moderator_id"], name: "moderator_id", using: :btree

  create_table "Organizer", force: :cascade do |t|
    t.string  "name",  limit: 100, null: false
    t.string  "email", limit: 100, null: false
    t.integer "phone", limit: 4,   null: false
    t.string  "url",   limit: 100, null: false
    t.string  "logo",  limit: 100, null: false
  end

  create_table "Speakers", force: :cascade do |t|
    t.integer "conference_id", limit: 4, null: false
    t.integer "speaker_id",    limit: 4, null: false
  end

  add_index "Speakers", ["conference_id"], name: "conference_id", using: :btree
  add_index "Speakers", ["speaker_id"], name: "speaker_id", using: :btree

  create_table "Specialites", force: :cascade do |t|
    t.string "name", limit: 100, null: false
  end

  create_table "Topic_Suggestions", force: :cascade do |t|
    t.integer "topic_id",     limit: 4, null: false
    t.integer "user_id",      limit: 4, null: false
    t.date    "created_date",           null: false
  end

  add_index "Topic_Suggestions", ["topic_id"], name: "topic_id", using: :btree
  add_index "Topic_Suggestions", ["user_id"], name: "user_id", using: :btree

  create_table "Topics", force: :cascade do |t|
    t.string "title",       limit: 100,   null: false
    t.text   "description", limit: 65535, null: false
  end

  create_table "User_Roles", force: :cascade do |t|
    t.string "name", limit: 100, null: false
  end

  create_table "Users", force: :cascade do |t|
    t.string  "email",                limit: 100, null: false
    t.string  "authentication_token", limit: 100, null: false
    t.string  "full_name",            limit: 100, null: false
    t.string  "password",             limit: 100, null: false
    t.string  "country",              limit: 100, null: false
    t.integer "user_role_id",         limit: 4,   null: false
    t.boolean "is_activated",         limit: 1,   null: false
  end

  add_index "Users", ["user_role_id"], name: "user_role_id", using: :btree

  create_table "Users_Specialities", force: :cascade do |t|
    t.integer "user_id",         limit: 4, null: false
    t.integer "specialities_id", limit: 4, null: false
  end

  add_index "Users_Specialities", ["specialities_id"], name: "specialities_id", using: :btree
  add_index "Users_Specialities", ["user_id"], name: "user_id", using: :btree

  create_table "conference_specialities", force: :cascade do |t|
    t.integer  "conference_id", limit: 4
    t.integer  "speciality_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conferences", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "location",          limit: 255
    t.integer  "organizer_id",      limit: 4
    t.integer  "conference_status", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "moderator_id",      limit: 4
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "conference_id", limit: 4
    t.integer  "moderator_id",  limit: 4
    t.integer  "doctor_id",     limit: 4
    t.integer  "status",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 255
    t.string   "url",        limit: 255
    t.string   "logo",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speakers", force: :cascade do |t|
    t.integer  "conference_id", limit: 4
    t.integer  "speaker_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specialities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topic_suggestions", force: :cascade do |t|
    t.integer  "topic_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.text     "description",   limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "conference_id", limit: 4
  end

  create_table "user_specialities", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.string   "speciality_id", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                limit: 255
    t.string   "authentication_token", limit: 255
    t.string   "full_name",            limit: 255
    t.string   "password",             limit: 255
    t.string   "country",              limit: 255
    t.integer  "role_id",              limit: 4
    t.boolean  "is_active",            limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
