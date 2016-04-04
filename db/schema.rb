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

ActiveRecord::Schema.define(version: 20160404183404) do

  create_table "attachments", force: :cascade do |t|
    t.integer  "entry_id",          limit: 4
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "attachments", ["entry_id"], name: "index_attachments_on_entry_id", using: :btree

  create_table "entries", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "responsible_id", limit: 4
    t.string   "description",    limit: 255
    t.decimal  "value",                        precision: 8, scale: 2, default: 0.0
    t.text     "note",           limit: 65535
    t.integer  "entity",         limit: 4,                             default: 1
    t.date     "at"
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
  end

  add_index "entries", ["responsible_id"], name: "index_entries_on_responsible_id", using: :btree
  add_index "entries", ["user_id"], name: "index_entries_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",           limit: 255
    t.string   "email",              limit: 255
    t.string   "name",               limit: 255
    t.string   "encrypted_password", limit: 255
    t.integer  "role",               limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
