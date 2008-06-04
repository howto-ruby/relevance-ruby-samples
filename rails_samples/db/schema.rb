# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 22) do

  create_table "bank_accounts", :force => true do |t|
    t.string   "owner"
    t.integer  "balance",    :limit => 11
    t.integer  "owner_ssn",  :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.float    "rate"
  end

  create_table "baseball_players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.float    "batting_average"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",    :limit => 11, :default => 0
    t.integer  "home_runs",       :limit => 11
  end

  create_table "changes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "author"
    t.integer  "document_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "state_id",   :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id",          :limit => 11
    t.integer  "commentable_id",   :limit => 11
    t.string   "commentable_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contracts", :force => true do |t|
    t.integer  "player_id",  :limit => 11
    t.integer  "team_id",    :limit => 11
    t.integer  "salary",     :limit => 11
    t.integer  "length",     :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hrMEM002", :primary_key => "memID", :force => true do |t|
    t.string  "memFN",  :limit => 50
    t.string  "memLN",  :limit => 50
    t.integer "memSSN", :limit => 9
  end

  create_table "hrPOL001", :primary_key => "polID", :force => true do |t|
    t.string  "polTYPE",   :limit => 50
    t.string  "polNUMBER", :limit => 50
    t.integer "polHOLDER", :limit => 11
  end

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.string   "body"
    t.string   "signed_by"
    t.string   "notable_type"
    t.integer  "notable_id",   :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quotes", :force => true do |t|
    t.string   "body"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "research_projects", :force => true do |t|
    t.string   "name"
    t.string   "author"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.integer  "capital_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

  create_table "widgets", :force => true do |t|
    t.string   "name"
    t.string   "color"
    t.float    "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
