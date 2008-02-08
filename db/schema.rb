# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 12) do

  create_table "languages", :force => true do |t|
    t.string "name",        :limit => 10
    t.string "pretty_name"
    t.string "ext",         :limit => 10
  end

  create_table "problems", :force => true do |t|
    t.string  "name",       :limit => 30
    t.string  "full_name"
    t.integer "full_score"
    t.date    "date_added"
    t.boolean "available"
  end

  create_table "rights", :force => true do |t|
    t.string "name"
    t.string "controller"
    t.string "action"
  end

  create_table "rights_roles", :id => false, :force => true do |t|
    t.integer "right_id"
    t.integer "role_id"
  end

  add_index "rights_roles", ["role_id"], :name => "index_rights_roles_on_role_id"

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "submissions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "problem_id"
    t.integer  "language_id"
    t.text     "source"
    t.binary   "binary"
    t.datetime "submitted_at"
    t.datetime "compiled_at"
    t.text     "compiler_message"
    t.datetime "graded_at"
    t.integer  "points"
    t.text     "grader_comment"
  end

  add_index "submissions", ["user_id", "problem_id"], :name => "index_submissions_on_user_id_and_problem_id"

  create_table "tasks", :force => true do |t|
    t.integer  "submission_id"
    t.datetime "created_at"
  end

  create_table "users", :force => true do |t|
    t.string "login",           :limit => 10
    t.string "full_name"
    t.string "hashed_password"
    t.string "salt",            :limit => 5
    t.string "alias"
    t.string "email"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end