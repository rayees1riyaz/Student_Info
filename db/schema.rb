

ActiveRecord::Schema[7.1].define(version: 2025_09_26_060024) do
  create_table "admissions", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "course_id", null: false
    t.decimal "fee"
    t.date "date_of_joining"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "admission_number"
    t.index ["admission_number"], name: "index_admissions_on_admission_number", unique: true
    t.index ["course_id"], name: "index_admissions_on_course_id"
    t.index ["student_id"], name: "index_admissions_on_student_id"
  end

  create_table "applications", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.date "dob"
    t.integer "course_id", null: false
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "application_number"
    t.integer "user_id"
    t.index ["application_number"], name: "index_applications_on_application_number", unique: true
    t.index ["course_id"], name: "index_applications_on_course_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subject"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "student_id", null: false
    t.decimal "marks"
    t.string "semesters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_results_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.date "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "student_number"
    t.index ["student_number"], name: "index_students_on_student_number", unique: true
  end



  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "registration_number"
    t.boolean "admin", default: false
    t.date "dob"
  end

  add_foreign_key "admissions", "courses"
  add_foreign_key "admissions", "students"
  add_foreign_key "applications", "Courses", column: "course_id"
  add_foreign_key "applications", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "results", "Students", column: "student_id"
  add_foreign_key "subjects", "courses"
end
