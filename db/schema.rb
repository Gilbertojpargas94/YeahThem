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

ActiveRecord::Schema.define(version: 2018_08_01_123100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "benefits", force: :cascade do |t|
    t.bigint "solution_id", null: false
    t.string "description", default: ""
    t.integer "validated", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["solution_id"], name: "index_benefits_on_solution_id"
  end

  create_table "clients", force: :cascade do |t|
    t.integer "person_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "last_name"
    t.string "image_url"
    t.string "profile_url"
    t.string "access_token"
    t.string "company_name"
    t.string "title"
    t.string "raw_data"
  end

  create_table "clients_solutions", id: false, force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "solution_id", null: false
    t.index ["client_id"], name: "index_clients_solutions_on_client_id"
    t.index ["solution_id"], name: "index_clients_solutions_on_solution_id"
  end

  create_table "companies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", default: "", null: false
    t.string "description", default: ""
    t.string "address", default: ""
    t.integer "total_validation", default: 0
    t.integer "status", limit: 2, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "companies_industries", id: false, force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "industry_id", null: false
    t.index ["company_id"], name: "index_companies_industries_on_company_id"
    t.index ["industry_id"], name: "index_companies_industries_on_industry_id"
  end

  create_table "industries", force: :cascade do |t|
    t.string "name", limit: 80, default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industry_branches", force: :cascade do |t|
    t.bigint "industry_id", null: false
    t.string "name", limit: 80, default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["industry_id"], name: "index_industry_branches_on_industry_id"
  end

  create_table "industry_branches_solutions", id: false, force: :cascade do |t|
    t.bigint "industry_branch_id", null: false
    t.bigint "solution_id", null: false
    t.index ["industry_branch_id"], name: "index_industry_branches_solutions_on_industry_branch_id"
    t.index ["solution_id"], name: "index_industry_branches_solutions_on_solution_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "title", default: "", null: false
    t.string "description", default: "", null: false
    t.integer "num_validation", default: 0
    t.integer "validated", limit: 2, default: 0
    t.integer "status", limit: 2, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.index ["company_id"], name: "index_solutions_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 80, default: "", null: false
    t.string "encrypted_password", limit: 80, default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name", limit: 80, default: "", null: false
    t.string "last_name", limit: 80, default: "", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "benefits", "solutions"
  add_foreign_key "companies", "users"
  add_foreign_key "industry_branches", "industries"
  add_foreign_key "solutions", "companies"
end
