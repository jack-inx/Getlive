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

ActiveRecord::Schema.define(:version => 20130419124023) do
  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "attached_files", :force => true do |t|
    t.integer  "attachment_id"
    t.string   "attachment_type"
    t.string   "dumpfile_file_name"
    t.string   "dumpfile_content_type"
    t.integer  "dumpfile_file_size"
    t.datetime "dumpfile_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authorizations", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "iso"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_portals", :force => true do |t|
    t.integer  "candidate_id"
    t.string   "candidate_type"
    t.integer  "job_post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_posts", :force => true do |t|
    t.integer  "recruiter_id"
    t.string   "job_title"
    t.string   "position"
    t.integer  "country_id"
    t.integer  "state_id"
    t.string   "city"
    t.string   "zip_code"
    t.integer  "salary"
    t.string   "term_of_assignment"
    t.string   "length"
    t.text     "job_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recruiters", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "position_title"
    t.text     "experience_summary"
    t.integer  "phone_number"
    t.string   "linkedin_url"
    t.string   "twitter_url"
  end

  add_index "recruiters", ["email"], :name => "index_recruiters_on_email", :unique => true
  add_index "recruiters", ["reset_password_token"], :name => "index_recruiters_on_reset_password_token", :unique => true

  create_table "states", :force => true do |t|
    t.integer  "country_id"
    t.string   "iso"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unregistered_users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_infos", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "job_title"
    t.integer  "country_id"
    t.integer  "state_id"
    t.string   "city"
    t.string   "zipcode"
    t.string   "years_of_exp"
    t.text     "brief_summary"
    t.string   "employment_status"
    t.string   "available_to_join"
    t.string   "edu_level"
    t.string   "university"
    t.string   "employment_type"
    t.boolean  "security_clearance"
    t.string   "sal_expectation"
    t.string   "hourly_expectation"
    t.boolean  "relocation_interest"
    t.string   "work_authorization"
    t.string   "willing_to_travel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "message"
    t.string   "signup_status"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
