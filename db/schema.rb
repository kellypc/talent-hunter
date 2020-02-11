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

ActiveRecord::Schema.define(version: 2020_02_07_171450) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "candidates", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_candidates_on_email", unique: true
    t.index ["reset_password_token"], name: "index_candidates_on_reset_password_token", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "profile_id"
    t.integer "headhunter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["headhunter_id"], name: "index_comments_on_headhunter_id"
    t.index ["profile_id"], name: "index_comments_on_profile_id"
  end

  create_table "headhunters", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_headhunters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_headhunters_on_reset_password_token", unique: true
  end

  create_table "job_applications", force: :cascade do |t|
    t.integer "status", default: 0
    t.boolean "highlight", default: false
    t.text "refuse_reason"
    t.integer "job_id"
    t.integer "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_job_applications_on_candidate_id"
    t.index ["job_id"], name: "index_job_applications_on_job_id"
  end

  create_table "job_proposals", force: :cascade do |t|
    t.string "company_name", default: ""
    t.datetime "init_date"
    t.float "salary"
    t.text "benefits"
    t.integer "status", default: 0
    t.integer "headhunter_id"
    t.integer "job_application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["headhunter_id"], name: "index_job_proposals_on_headhunter_id"
    t.index ["job_application_id"], name: "index_job_proposals_on_job_application_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "skills"
    t.float "salary"
    t.integer "job_level"
    t.date "start_date"
    t.date "end_date"
    t.string "local_job"
    t.integer "status"
    t.integer "headhunter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["headhunter_id"], name: "index_jobs_on_headhunter_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "full_name"
    t.string "social_name"
    t.string "title"
    t.string "address"
    t.integer "phone_number"
    t.date "birth_date"
    t.string "academic_formation"
    t.text "description"
    t.string "skills"
    t.text "experience"
    t.integer "status", default: 0
    t.integer "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_profiles_on_candidate_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.integer "product_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

end
