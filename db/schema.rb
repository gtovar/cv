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

ActiveRecord::Schema.define(version: 20170918031752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experience_translations", force: :cascade do |t|
    t.integer "experience_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["experience_id"], name: "index_experience_translations_on_experience_id"
    t.index ["locale"], name: "index_experience_translations_on_locale"
  end

  create_table "experiences", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "position"
    t.boolean "actual"
    t.index ["slug"], name: "index_experiences_on_slug", unique: true
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "proyect_translations", force: :cascade do |t|
    t.integer "proyect_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "position"
    t.text "activities"
    t.text "outstaning"
    t.text "description"
    t.text "activity_description"
    t.string "category"
    t.text "tools"
    t.index ["locale"], name: "index_proyect_translations_on_locale"
    t.index ["proyect_id"], name: "index_proyect_translations_on_proyect_id"
  end

  create_table "proyects", id: :serial, force: :cascade do |t|
    t.string "name"
    t.date "start_time"
    t.date "end_time"
    t.string "position"
    t.text "activities"
    t.text "outstaning"
    t.text "tools"
    t.text "description"
    t.string "cover"
    t.text "activity_description"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link"
    t.string "logo"
    t.string "slug"
    t.integer "experience_id"
    t.boolean "actual", default: false
    t.index ["slug"], name: "index_proyects_on_slug", unique: true
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
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
