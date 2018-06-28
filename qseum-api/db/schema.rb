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

<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
ActiveRecord::Schema.define(version: 2018_06_28_175735) do
=======
ActiveRecord::Schema.define(version: 2018_06_28_202226) do
>>>>>>> Stashed changes
=======
ActiveRecord::Schema.define(version: 2018_06_28_202226) do
>>>>>>> Stashed changes
=======
ActiveRecord::Schema.define(version: 2018_06_28_202226) do
>>>>>>> Stashed changes

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "issues", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.text "text"
  end

  create_table "memberships", force: :cascade do |t|
    t.string "account"
    t.string "primary_name"
    t.string "secondary_name"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.integer "membership_type"
    t.date "join_date"
    t.date "expiration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "account"
    t.string "username"
    t.string "password_digest"
    t.string "api_token"
    t.string "email"
    t.boolean "is_admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "accommodations"
    t.string "selfie"
    t.boolean "valid_selfie"
    t.string "reset_digest"
  end

  create_table "visits", force: :cascade do |t|
    t.integer "user_id"
    t.string "account"
    t.integer "visitors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
  end

end
