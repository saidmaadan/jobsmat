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

ActiveRecord::Schema.define(version: 20151224131308) do

  create_table "applies", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.string   "resume"
    t.integer  "candidate_id"
    t.integer  "job_id"
    t.integer  "employer_id"
    t.string   "phone"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "candidates", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "username"
    t.string   "about"
    t.string   "experience"
    t.string   "education"
    t.string   "desired_salary"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country"
    t.string   "twitter_url"
    t.string   "linkedin_url"
    t.string   "facebook_url"
    t.string   "github_url"
    t.string   "bb_pin"
    t.string   "provider"
    t.string   "uid"
    t.string   "auth_token"
    t.string   "website_url"
    t.string   "instagram_url"
    t.string   "availability"
    t.string   "skills"
    t.string   "job_type"
    t.string   "languages"
    t.string   "how_heard"
    t.string   "cand_image"
    t.string   "resume"
    t.string   "projects_link"
    t.string   "portfolio_url"
    t.string   "favorite_websites"
    t.string   "headlines"
    t.string   "skype_id"
    t.string   "phone_number"
    t.string   "slug"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "admin",             default: false
    t.text     "headline"
    t.string   "dribbble_url"
  end

  add_index "candidates", ["slug"], name: "index_candidates_on_slug", unique: true

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "about"
    t.string   "industry"
    t.string   "founded"
    t.string   "size"
    t.string   "subsidiaries"
    t.string   "location"
    t.string   "website"
    t.string   "logo"
    t.string   "company_image"
    t.string   "slug"
    t.integer  "employer_id"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "youtube"
    t.string   "linkedin"
    t.string   "video"
    t.string   "instagram"
    t.string   "googleplus"
    t.string   "pinterest"
    t.string   "github"
    t.text     "twitter_widget"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "companies", ["slug"], name: "index_companies_on_slug", unique: true

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "messages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string   "school"
    t.string   "degree"
    t.string   "year"
    t.integer  "candidate_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
  end

  add_index "educations", ["candidate_id"], name: "index_educations_on_candidate_id"
  add_index "educations", ["slug"], name: "index_educations_on_slug", unique: true

  create_table "employers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "username"
    t.string   "company_name"
    t.string   "location"
    t.string   "zip_code"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "facebook"
    t.string   "website_url"
    t.string   "instagram"
    t.text     "company_description"
    t.string   "EmpImage"
    t.string   "headlines"
    t.string   "industry"
    t.string   "company_size"
    t.string   "skype_id"
    t.string   "phone_number"
    t.string   "logo"
    t.string   "auth_token"
    t.string   "slug"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin",               default: false
    t.boolean  "author",              default: false
    t.text     "headline"
    t.string   "emp_image"
  end

  add_index "employers", ["slug"], name: "index_employers_on_slug", unique: true

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "interviews", force: :cascade do |t|
    t.string   "job_title"
    t.text     "process"
    t.text     "questions"
    t.text     "anwsers"
    t.string   "interview_difficulty"
    t.string   "hired"
    t.string   "how_heard"
    t.string   "duration"
    t.string   "when"
    t.string   "where"
    t.string   "when_month"
    t.string   "duration_days"
    t.string   "how_helpful"
    t.integer  "candidate_id"
    t.integer  "employer_id"
    t.integer  "company_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "slug"
  end

  add_index "interviews", ["company_id"], name: "index_interviews_on_company_id"
  add_index "interviews", ["slug"], name: "index_interviews_on_slug", unique: true

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.string   "skills"
    t.text     "description"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country"
    t.string   "position_type"
    t.string   "pay_rate"
    t.string   "job_length"
    t.string   "travel_required"
    t.integer  "employer_id"
    t.integer  "candidate_id"
    t.integer  "company_id"
    t.string   "company_name"
    t.string   "industry"
    t.string   "logo"
    t.string   "company_size"
    t.string   "website_url"
    t.text     "company_description"
    t.text     "responsibility"
    t.string   "experience"
    t.string   "slug"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "jobs", ["slug"], name: "index_jobs_on_slug", unique: true

  create_table "reviews", force: :cascade do |t|
    t.string   "company_name"
    t.integer  "rating"
    t.string   "employee_status"
    t.string   "employee_type"
    t.string   "title"
    t.text     "pros"
    t.text     "cons"
    t.text     "advice"
    t.integer  "company_id"
    t.integer  "employer_id"
    t.integer  "candidate_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "slug"
  end

  add_index "reviews", ["candidate_id"], name: "index_reviews_on_candidate_id"
  add_index "reviews", ["company_id"], name: "index_reviews_on_company_id"
  add_index "reviews", ["employer_id"], name: "index_reviews_on_employer_id"
  add_index "reviews", ["slug"], name: "index_reviews_on_slug", unique: true

  create_table "tips", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "source_url"
    t.integer  "employer_id"
    t.string   "logo"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tips", ["slug"], name: "index_tips_on_slug", unique: true

  create_table "works", force: :cascade do |t|
    t.string   "company"
    t.string   "position"
    t.string   "start_month"
    t.string   "start_year"
    t.string   "end_month"
    t.string   "end_year"
    t.string   "status"
    t.text     "description"
    t.integer  "candidate_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
  end

  add_index "works", ["candidate_id"], name: "index_works_on_candidate_id"
  add_index "works", ["slug"], name: "index_works_on_slug", unique: true

end
