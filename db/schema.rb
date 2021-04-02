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

ActiveRecord::Schema.define(version: 2019_08_11_034224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "category_id", null: false
    t.string "title", null: false
    t.string "company_name", null: false
    t.string "site_url"
    t.string "location"
    t.text "description", null: false
    t.text "contact_message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "vacancy_completed"
    t.datetime "expire_at"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "resumes", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "category_id", null: false
    t.string "name", null: false
    t.string "title", null: false
    t.string "facebook_url"
    t.string "twitter_url"
    t.string "google_plus_url"
    t.string "linked_in_url"
    t.string "phone"
    t.string "site_url"
    t.string "contact_email"
    t.string "location"
    t.boolean "available", default: false
    t.boolean "listed", default: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_resumes_on_category_id"
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "settings", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.boolean "new_jobs", default: true
    t.boolean "new_resumes", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_settings_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
