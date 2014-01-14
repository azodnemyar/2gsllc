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

ActiveRecord::Schema.define(version: 20131125175050) do

  create_table "assignments", force: true do |t|
    t.integer  "workday_id"
    t.integer  "employee_id"
    t.integer  "timesheet_id"
    t.integer  "job_id"
    t.datetime "date"
    t.integer  "hours",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", force: true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "attachments", ["attachable_id", "attachable_type"], name: "index_attachments_on_attachable_id_and_attachable_type"

  create_table "documents", force: true do |t|
    t.integer  "machine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "wage"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status",     default: true
  end

  create_table "jobs", force: true do |t|
    t.string   "number"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status",     default: true
  end

  create_table "machine_meta", force: true do |t|
    t.string   "meta_key"
    t.string   "meta_value"
    t.integer  "machine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "machines", force: true do |t|
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.string   "serial"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "value"
  end

  create_table "notes", force: true do |t|
    t.string   "subject"
    t.string   "body"
    t.integer  "machine_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.datetime "due_date"
    t.boolean  "completed",     default: false
    t.integer  "user_id"
    t.integer  "taskable_id"
    t.string   "taskable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completed_by"
  end

  add_index "tasks", ["taskable_id", "taskable_type"], name: "index_tasks_on_taskable_id_and_taskable_type"

  create_table "timesheets", force: true do |t|
    t.integer  "employee_id"
    t.datetime "startdate"
    t.datetime "enddate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "workdays", force: true do |t|
    t.integer  "employee_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "timesheet_id"
  end

end
