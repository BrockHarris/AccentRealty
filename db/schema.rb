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

ActiveRecord::Schema.define(:version => 20140218011768) do

  create_table "admins", :force => true do |t|
    t.string   "email"
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "owner",         :default => false
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.datetime "deleted_at"
  end

  create_table "blogposts", :force => true do |t|
    t.integer  "admin_id"
    t.string   "title"
    t.string   "category"
    t.text     "heading"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "deleted_at"
  end

  add_index "blogposts", ["admin_id"], :name => "index_blogposts_on_admin_id"
  add_index "blogposts", ["category"], :name => "index_blogposts_on_category"

  create_table "communities", :force => true do |t|
    t.string   "city"
    t.string   "county"
    t.text     "townhall_link"
    t.text     "latitude"
    t.text     "longitude"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "communities", ["county"], :name => "index_communities_on_county"

  create_table "evaluations", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "email"
    t.string   "phone"
    t.text     "comments"
    t.string   "property_address"
    t.string   "property_city"
    t.string   "property_state"
    t.string   "property_zip"
    t.string   "property_type"
    t.string   "resident"
    t.string   "relationship"
    t.string   "bedrooms"
    t.string   "baths"
    t.string   "condition"
    t.string   "lotsize"
    t.string   "parking"
    t.string   "spaces"
    t.string   "listingstatus"
    t.string   "basement"
    t.string   "sellingdate"
    t.string   "heattype"
    t.string   "aircontype"
    t.string   "homestyle"
    t.string   "yearbuilt"
    t.string   "movingto"
    t.string   "fireplaces"
    t.string   "rooms"
    t.string   "sqfeet"
    t.boolean  "pool",                    :default => false
    t.boolean  "waterfront",              :default => false
    t.boolean  "waterview",               :default => false
    t.string   "agentstatus"
    t.string   "current_agent_firstname"
    t.string   "current_agent_lastname"
    t.string   "request_agent_firstname"
    t.string   "request_agent_lastname"
    t.boolean  "read",                    :default => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "response_subject"
    t.text     "response_body"
    t.integer  "admin_id"
  end

  create_table "messages", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "body"
    t.boolean  "read"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "response_subject"
    t.text     "response_body"
    t.boolean  "responded_to"
    t.boolean  "newsletter",       :default => false
  end

  create_table "pagecontents", :force => true do |t|
    t.integer  "page_type"
    t.string   "section_title"
    t.text     "section_body"
    t.string   "subsection_title"
    t.text     "subsection_body"
    t.string   "page_header"
    t.boolean  "is_header",        :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "photo_file_name"
    t.string   "photo_file_type"
    t.integer  "photo_file_size"
    t.string   "partner_name"
    t.string   "partner_email"
    t.string   "partner_phone"
    t.string   "partner_link"
    t.string   "partner_type"
  end

  add_index "pagecontents", ["page_type"], :name => "index_pagecontents_on_page_type"

  create_table "questions", :force => true do |t|
    t.integer  "admin_id"
    t.text     "content"
    t.text     "response"
    t.string   "category"
    t.string   "email"
    t.boolean  "published",    :default => false
    t.boolean  "responded_to", :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "questions", ["admin_id"], :name => "index_questions_on_admin_id"
  add_index "questions", ["category"], :name => "index_questions_on_category"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "firstname"
    t.string   "lastname"
    t.boolean  "updates_news",                            :default => true
    t.boolean  "updates_blog_posts",                      :default => false
    t.datetime "deleted_at"
    t.string   "state"
    t.string   "mode"
    t.string   "activation_code",          :limit => 100
    t.datetime "activated_at"
    t.datetime "activation_email_sent_at"
    t.string   "reset_code",               :limit => 50
    t.datetime "reset_code_at"
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
  end

end
