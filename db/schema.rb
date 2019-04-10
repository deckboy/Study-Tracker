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

ActiveRecord::Schema.define(version: 2019_04_04_004841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles_tags", id: false, force: :cascade do |t|
    t.integer "article_id"
    t.integer "tag_id"
  end

  create_table "blogs", id: :serial, force: :cascade do |t|
    t.text "settings"
    t.string "base_url", limit: 255
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "position"
    t.string "permalink", limit: 255
    t.text "keywords"
    t.text "description"
    t.integer "parent_id"
    t.index ["permalink"], name: "index_categories_on_permalink"
  end

  create_table "categorizations", id: :serial, force: :cascade do |t|
    t.integer "article_id"
    t.integer "category_id"
    t.boolean "is_primary"
  end

  create_table "contents", id: :serial, force: :cascade do |t|
    t.string "type", limit: 255
    t.string "title", limit: 255
    t.string "author", limit: 255
    t.text "body"
    t.text "extended"
    t.text "excerpt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.string "permalink", limit: 255
    t.string "guid", limit: 255
    t.integer "text_filter_id"
    t.text "whiteboard"
    t.string "name", limit: 255
    t.boolean "published", default: false
    t.boolean "allow_pings"
    t.boolean "allow_comments"
    t.datetime "published_at"
    t.string "state", limit: 255
    t.integer "parent_id"
    t.text "settings"
    t.string "post_type", limit: 255, default: "read"
    t.index ["published"], name: "index_contents_on_published"
    t.index ["text_filter_id"], name: "index_contents_on_text_filter_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedback", id: :serial, force: :cascade do |t|
    t.string "type", limit: 255
    t.string "title", limit: 255
    t.string "author", limit: 255
    t.text "body"
    t.text "excerpt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.string "guid", limit: 255
    t.integer "text_filter_id"
    t.text "whiteboard"
    t.integer "article_id"
    t.string "email", limit: 255
    t.string "url", limit: 255
    t.string "ip", limit: 40
    t.string "blog_name", limit: 255
    t.boolean "published", default: false
    t.datetime "published_at"
    t.string "state", limit: 255
    t.boolean "status_confirmed"
    t.index ["article_id"], name: "index_feedback_on_article_id"
    t.index ["text_filter_id"], name: "index_feedback_on_text_filter_id"
  end

  create_table "notifications", id: :serial, force: :cascade do |t|
    t.integer "content_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_caches", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.index ["name"], name: "index_page_caches_on_name"
  end

  create_table "pings", id: :serial, force: :cascade do |t|
    t.integer "article_id"
    t.string "url", limit: 255
    t.datetime "created_at"
    t.index ["article_id"], name: "index_pings_on_article_id"
  end

  create_table "post_types", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "permalink", limit: 255
    t.string "description", limit: 255
  end

  create_table "profiles", id: :serial, force: :cascade do |t|
    t.string "label", limit: 255
    t.string "nicename", limit: 255
    t.text "modules"
  end

  create_table "profiles_rights", id: false, force: :cascade do |t|
    t.integer "profile_id"
    t.integer "right_id"
  end

  create_table "redirections", id: :serial, force: :cascade do |t|
    t.integer "content_id"
    t.integer "redirect_id"
  end

  create_table "redirects", id: :serial, force: :cascade do |t|
    t.string "from_path", limit: 255
    t.string "to_path", limit: 255
    t.string "origin", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", id: :serial, force: :cascade do |t|
    t.integer "size"
    t.string "filename", limit: 255
    t.string "mime", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "article_id"
    t.boolean "itunes_metadata"
    t.string "itunes_author", limit: 255
    t.string "itunes_subtitle", limit: 255
    t.integer "itunes_duration"
    t.text "itunes_summary"
    t.string "itunes_keywords", limit: 255
    t.string "itunes_category", limit: 255
    t.boolean "itunes_explicit"
  end

  create_table "rights", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "description", limit: 255
  end

  create_table "schedules", force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.integer "day_of_week"
    t.bigint "subject_id"
    t.boolean "completed"
    t.date "dates"
    t.index ["subject_id"], name: "index_schedules_on_subject_id"
  end

  create_table "sidebars", id: :serial, force: :cascade do |t|
    t.integer "active_position"
    t.text "config"
    t.integer "staged_position"
    t.string "type", limit: 255
  end

  create_table "sitealizer", id: :serial, force: :cascade do |t|
    t.string "path", limit: 255
    t.string "ip", limit: 255
    t.string "referer", limit: 255
    t.string "language", limit: 255
    t.string "user_agent", limit: 255
    t.datetime "created_at"
    t.date "created_on"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.date "start_date"
    t.date "end_date"
    t.integer "hours"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_subjects_on_user_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "display_name", limit: 255
  end

  create_table "text_filters", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "description", limit: 255
    t.string "markup", limit: 255
    t.text "filters"
    t.text "params"
  end

  create_table "triggers", id: :serial, force: :cascade do |t|
    t.integer "pending_item_id"
    t.string "pending_item_type", limit: 255
    t.datetime "due_at"
    t.string "trigger_method", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.bigint "phone_no"
    t.string "provider"
    t.string "year"
    t.string "first_name"
    t.string "last_name"
    t.string "uid"
    t.string "uin"
  end

end
