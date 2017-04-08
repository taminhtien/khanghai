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

ActiveRecord::Schema.define(version: 20170408153614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at",   default: '2017-04-02 10:08:35'
    t.datetime "updated_at",   default: '2017-04-02 10:08:35'
  end

  create_table "contracts", force: :cascade do |t|
    t.string   "code"
    t.string   "type"
    t.string   "assignee"
    t.datetime "assigned_date"
    t.datetime "estimate_completed_date"
    t.text     "summary"
    t.text     "requirement"
    t.text     "development"
    t.string   "propose_assignee"
    t.integer  "customer_id"
    t.datetime "created_at",              default: '2017-04-01 15:38:45'
    t.datetime "updated_at",              default: '2017-04-01 15:38:45'
  end

  add_index "contracts", ["customer_id"], name: "index_contracts_on_customer_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "permanent_address"
    t.string   "contact_address"
    t.string   "phone_number"
    t.datetime "created_at",        default: '2017-04-01 15:38:45'
    t.datetime "updated_at",        default: '2017-04-01 15:38:45'
    t.integer  "birthday"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "slug"
    t.datetime "created_at",           default: '2016-09-10 08:20:02'
    t.datetime "updated_at",           default: '2016-09-10 08:20:02'
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id", using: :btree
  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true, using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "slug"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "short_description"
    t.datetime "created_at",           default: '2017-04-01 15:11:59'
    t.datetime "updated_at",           default: '2017-04-01 15:11:59'
  end

  add_index "services", ["slug"], name: "index_services_on_slug", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.text     "description"
    t.string   "facebook_url"
    t.string   "email",                  default: "",                    null: false
    t.string   "encrypted_password",     default: "",                    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "role"
    t.datetime "created_at",             default: '2017-04-01 15:38:45'
    t.datetime "updated_at",             default: '2017-04-01 15:38:45'
    t.string   "job_title"
    t.string   "salutation"
    t.string   "last_name"
    t.string   "twitter_url"
    t.string   "linkedin_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
