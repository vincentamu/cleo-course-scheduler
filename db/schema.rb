# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_16_045835) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cores", primary_key: "core_id", force: :cascade do |t|
    t.string "core_name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", primary_key: "crn", force: :cascade do |t|
    t.string "cname", limit: 255
    t.text "description"
    t.integer "credit_hours"
    t.integer "lecture_hours"
    t.integer "lab_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degree_plans", primary_key: "did", force: :cascade do |t|
    t.string "degree_name", limit: 255
    t.integer "major_id"
    t.integer "required_courses", default: [], array: true
    t.integer "core_courses", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["major_id"], name: "index_degree_plans_on_major_id"
  end

  create_table "emphases", primary_key: "emphasis_id", force: :cascade do |t|
    t.string "emphasis_name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "majors", primary_key: "mid", force: :cascade do |t|
    t.string "major_name", limit: 255
    t.string "college_name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_degree_plans", primary_key: ["my_did", "crn"], force: :cascade do |t|
    t.integer "my_did", null: false
    t.integer "crn", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crn"], name: "index_my_degree_plans_on_crn"
    t.index ["my_did"], name: "index_my_degree_plans_on_my_did"
  end

  create_table "pre_reqs", force: :cascade do |t|
    t.integer "crn"
    t.integer "prereq_crn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crn"], name: "index_pre_reqs_on_crn"
    t.index ["prereq_crn"], name: "index_pre_reqs_on_prereq_crn"
  end

  create_table "students", primary_key: "uin", force: :cascade do |t|
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "email", limit: 255
    t.integer "enrol_year"
    t.string "enrol_semester"
    t.integer "grad_year"
    t.string "grad_semester"
    t.integer "major_id"
    t.integer "degree_plan_id"
    t.integer "enrolled_courses", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["degree_plan_id"], name: "index_students_on_degree_plan_id"
    t.index ["major_id"], name: "index_students_on_major_id"
  end

  create_table "tracks", primary_key: "tid", force: :cascade do |t|
    t.string "track_name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
