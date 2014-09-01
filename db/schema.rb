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

ActiveRecord::Schema.define(version: 20140831160030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "elogs", force: true do |t|
    t.integer  "exam_id"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "elogs", ["patient_id", "exam_id"], name: "index_elogs_on_patient_id_and_exam_id", using: :btree

  create_table "exams", force: true do |t|
    t.string   "name"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exams", ["user_id"], name: "index_exams_on_user_id", using: :btree

  create_table "patients", force: true do |t|
    t.string   "name"
    t.string   "phones"
    t.string   "email"
    t.integer  "user_id"
    t.string   "health_plan"
    t.string   "health_plan_code"
    t.string   "home_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patients", ["user_id"], name: "index_patients_on_user_id", using: :btree

  create_table "plogs", force: true do |t|
    t.integer  "prescription_id"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plogs", ["patient_id", "prescription_id"], name: "index_plogs_on_patient_id_and_prescription_id", using: :btree

  create_table "prescriptions", force: true do |t|
    t.string   "illness"
    t.string   "name"
    t.text     "text"
    t.boolean  "manipulated"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prescriptions", ["user_id"], name: "index_prescriptions_on_user_id", using: :btree

  create_table "user_configs", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.string   "crm"
    t.boolean  "send_email"
    t.text     "emails_to_send"
    t.text     "user_data"
    t.text     "places"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.integer  "role"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
