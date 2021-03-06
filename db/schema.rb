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

ActiveRecord::Schema.define(version: 20170503231949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "connection_type"
    t.text     "notes"
    t.datetime "last_contact"
    t.datetime "follow_up_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "goals", force: :cascade do |t|
    t.string   "name"
    t.integer  "duration"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "category"
    t.integer  "user_id"
  end

  add_index "goals", ["user_id"], name: "index_goals_on_user_id", using: :btree

  create_table "meetings", force: :cascade do |t|
    t.text     "notes"
    t.date     "date"
    t.integer  "connection_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "meetings", ["connection_id"], name: "index_meetings_on_connection_id", using: :btree

  create_table "routine_items", force: :cascade do |t|
    t.string   "type"
    t.boolean  "complete"
    t.string   "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routine_logs", force: :cascade do |t|
    t.integer  "routine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "routine_logs", ["routine_id"], name: "index_routine_logs_on_routine_id", using: :btree

  create_table "routine_task_logs", force: :cascade do |t|
    t.integer  "routine_log_id"
    t.boolean  "complete"
    t.string   "detail"
    t.text     "response"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "routine_task_logs", ["routine_log_id"], name: "index_routine_task_logs_on_routine_log_id", using: :btree

  create_table "routine_tasks", force: :cascade do |t|
    t.boolean  "requires_response"
    t.boolean  "complete"
    t.string   "detail"
    t.integer  "routine_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "response"
  end

  add_index "routine_tasks", ["routine_id"], name: "index_routine_tasks_on_routine_id", using: :btree

  create_table "routines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.string   "repeat_frequency"
  end

  add_index "routines", ["user_id"], name: "index_routines_on_user_id", using: :btree

  create_table "to_dos", force: :cascade do |t|
    t.string   "estimate"
    t.string   "label"
    t.string   "day_of_week"
    t.boolean  "complete"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "goals", "users"
  add_foreign_key "meetings", "connections"
  add_foreign_key "routine_logs", "routines", on_delete: :cascade
  add_foreign_key "routine_task_logs", "routine_logs"
  add_foreign_key "routine_tasks", "routines", on_delete: :cascade
  add_foreign_key "routines", "users"
end
