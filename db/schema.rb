# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_15_140433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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

  create_table "connections", force: :cascade do |t|
    t.integer "connecting_id"
    t.integer "connected_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_connections_on_user_id"
  end

  create_table "course_roadmaps", force: :cascade do |t|
    t.string "status"
    t.bigint "course_id", null: false
    t.bigint "roadmap_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
    t.index ["course_id"], name: "index_course_roadmaps_on_course_id"
    t.index ["roadmap_id"], name: "index_course_roadmaps_on_roadmap_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "provider"
    t.string "title"
    t.integer "cost"
    t.integer "duration"
    t.text "provider_url"
    t.integer "hourse_per_week"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "topic_id"
    t.index ["topic_id"], name: "index_courses_on_topic_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.string "reaction"
    t.bigint "user_id", null: false
    t.bigint "connection_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["connection_id"], name: "index_messages_on_connection_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "roadmap_topics", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "roadmap_id"
    t.bigint "topic_id"
    t.index ["roadmap_id"], name: "index_roadmap_topics_on_roadmap_id"
    t.index ["topic_id"], name: "index_roadmap_topics_on_topic_id"
  end

  create_table "roadmaps", force: :cascade do |t|
    t.boolean "privacy_option"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_roadmaps_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "budget"
    t.integer "timeframe"
    t.string "current_role"
    t.string "current_industry"
    t.string "future_role"
    t.string "future_industry"
    t.integer "available_hrs_per_week"
    t.string "status"
    t.string "location"
    t.text "motivation"
    t.string "satisfaction"
    t.text "journey_experience"
    t.text "advice"
    t.string "img_url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "connections", "users"
  add_foreign_key "course_roadmaps", "courses"
  add_foreign_key "course_roadmaps", "roadmaps"
  add_foreign_key "courses", "topics"
  add_foreign_key "messages", "connections"
  add_foreign_key "messages", "users"
  add_foreign_key "roadmap_topics", "roadmaps"
  add_foreign_key "roadmap_topics", "topics"
  add_foreign_key "roadmaps", "users"
end
