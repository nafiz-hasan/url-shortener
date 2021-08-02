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

ActiveRecord::Schema.define(version: 2021_08_01_223354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aliased_links", force: :cascade do |t|
    t.string "long_url"
    t.string "token", limit: 30, null: false
    t.string "creator_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["token"], name: "index_aliased_links_on_token", unique: true
  end

  create_table "infos", force: :cascade do |t|
    t.string "visitor_ip"
    t.bigint "aliased_link_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aliased_link_id"], name: "index_infos_on_aliased_link_id"
  end

  add_foreign_key "infos", "aliased_links"
end
