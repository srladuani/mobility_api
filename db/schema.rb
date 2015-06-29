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

ActiveRecord::Schema.define(version: 20150629041345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conference_specialities", force: :cascade do |t|
    t.integer  "conference_id"
    t.integer  "speciality_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conferences", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "location"
    t.integer  "organizer_id"
    t.integer  "conference_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "moderator_id"
    t.integer  "topic_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "conference_id"
    t.integer  "moderator_id"
    t.integer  "doctor_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "url"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speakers", force: :cascade do |t|
    t.integer  "conference_id"
    t.integer  "speaker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specialities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topic_suggestions", force: :cascade do |t|
    t.integer  "topic_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_specialities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "speciality_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "authentication_token"
    t.string   "full_name"
    t.string   "password"
    t.string   "country"
    t.integer  "role_id"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
