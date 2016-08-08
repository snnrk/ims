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

ActiveRecord::Schema.define(version: 20160805051726) do

  create_table "issue_ownerships", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "issue_ownerships", ["author_id", "issue_id"], name: "index_issue_ownerships_on_author_id_and_issue_id", unique: true
  add_index "issue_ownerships", ["author_id"], name: "index_issue_ownerships_on_author_id"
  add_index "issue_ownerships", ["issue_id"], name: "index_issue_ownerships_on_issue_id"

  create_table "issues", force: :cascade do |t|
    t.string   "title"
    t.datetime "fired_time"
    t.datetime "recovered_time"
    t.datetime "start_time"
    t.datetime "ending_time"
    t.string   "impact"
    t.integer  "author_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "issues", ["author_id"], name: "index_issues_on_author_id"

  create_table "users", force: :cascade do |t|
    t.string   "displayname"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
