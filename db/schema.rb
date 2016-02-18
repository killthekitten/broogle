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

ActiveRecord::Schema.define(version: 20160218134954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "broogle_stems", force: :cascade do |t|
    t.string   "matched_string", null: false
    t.string   "content",        null: false
    t.string   "column",         null: false
    t.integer  "document_id",    null: false
    t.string   "document_type",  null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "broogle_stems", ["column"], name: "index_broogle_stems_on_column", using: :btree
  add_index "broogle_stems", ["content"], name: "index_broogle_stems_on_content", using: :btree
  add_index "broogle_stems", ["document_type", "document_id"], name: "index_broogle_stems_on_document_type_and_document_id", using: :btree

  create_table "famous_quotes", force: :cascade do |t|
    t.string   "author"
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
