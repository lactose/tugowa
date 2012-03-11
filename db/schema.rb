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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120310234259) do

  create_table "instances", :force => true do |t|
    t.integer  "rounds"
    t.datetime "start"
    t.integer  "sheet_id"
    t.integer  "team_a"
    t.integer  "team_b"
    t.boolean  "public"
    t.boolean  "auto_assign"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  add_index "instances", ["sheet_id"], :name => "index_instances_on_sheet_id"
  add_index "instances", ["user_id"], :name => "index_instances_on_user_id"

  create_table "pairs", :force => true do |t|
    t.string   "question"
    t.string   "answer"
    t.string   "choice_a"
    t.string   "choice_b"
    t.string   "choice_c"
    t.string   "choice_d"
    t.integer  "sheet_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pairs", ["sheet_id"], :name => "index_pairs_on_sheet_id"

  create_table "sheets", :force => true do |t|
    t.string   "name"
    t.integer  "topic_id"
    t.boolean  "multichoice", :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "user_id"
  end

  add_index "sheets", ["topic_id"], :name => "index_sheets_on_topic_id"
  add_index "sheets", ["user_id"], :name => "index_sheets_on_user_id"

  create_table "teams", :force => true do |t|
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "correct"
    t.integer  "incorrect"
    t.integer  "creator_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "nick"
    t.integer  "answers_r"
    t.integer  "answers_w"
    t.integer  "wins"
    t.integer  "losses"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "team_id"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "confirm_code"
    t.boolean  "confirmed",          :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
