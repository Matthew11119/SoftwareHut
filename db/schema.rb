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

ActiveRecord::Schema.define(version: 2019_03_19_230935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "criteria", force: :cascade do |t|
    t.text "criteria_description"
    t.boolean "criteria_critical"
    t.integer "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "criteria_results", force: :cascade do |t|
    t.integer "criteria_mark"
    t.integer "answer"
    t.integer "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "exams", force: :cascade do |t|
    t.string "exam_code"
    t.date "date"
    t.string "name"
    t.string "module_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
  end

  create_table "modules_students", id: false, force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "module_id", null: false
    t.index ["module_id", "student_id"], name: "index_modules_students_on_module_id_and_student_id"
    t.index ["student_id", "module_id"], name: "index_modules_students_on_student_id_and_module_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "station_results", force: :cascade do |t|
    t.integer "station_id"
    t.integer "student_id"
    t.string "examiner_name"
    t.integer "mark"
    t.string "feedback"
    t.string "audio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string "station_name"
    t.integer "pass_mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "exam_code"
  end

  create_table "students", force: :cascade do |t|
    t.string "student_id"
    t.string "forename"
    t.string "surname"
    t.integer "regno"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uni_modules", force: :cascade do |t|
    t.string "module_code"
    t.string "module_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "uid"
    t.string "mail"
    t.string "ou"
    t.string "dn"
    t.string "sn"
    t.string "givenname"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email"
    t.index ["username"], name: "index_users_on_username"
  end

end
