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

ActiveRecord::Schema.define(version: 20171102073632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_conversations_on_recipient_id"
    t.index ["sender_id"], name: "index_conversations_on_sender_id"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "title"
    t.string "venue"
    t.string "city"
    t.string "country"
    t.text "content"
    t.date "date"
    t.integer "accepted_offer"
    t.date "date_accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_listings_on_owner_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "conversation_id"
    t.text "content"
    t.datetime "time_read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_messages_on_author_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "photographer_id"
    t.decimal "amount"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_offers_on_listing_id"
    t.index ["photographer_id"], name: "index_offers_on_photographer_id"
  end

  create_table "photos", force: :cascade do |t|
    t.text "image_data"
    t.bigint "portfolio_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_photos_on_portfolio_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.text "bio"
    t.bigint "user_id"
    t.text "avatar_data"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_portfolios_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "portfolio_id"
    t.text "content"
    t.decimal "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_reviews_on_author_id"
    t.index ["portfolio_id"], name: "index_reviews_on_portfolio_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "conversations", "users", column: "recipient_id"
  add_foreign_key "conversations", "users", column: "sender_id"
  add_foreign_key "listings", "users", column: "owner_id"
  add_foreign_key "messages", "users", column: "author_id"
  add_foreign_key "messages", "users", column: "conversation_id"
  add_foreign_key "offers", "listings"
  add_foreign_key "offers", "users", column: "photographer_id"
  add_foreign_key "photos", "portfolios"
  add_foreign_key "portfolios", "users"
  add_foreign_key "reviews", "portfolios"
  add_foreign_key "reviews", "users", column: "author_id"
end
