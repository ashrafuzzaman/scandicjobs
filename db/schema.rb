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

ActiveRecord::Schema.define(:version => 20100904122235) do

  create_table "applicants", :force => true do |t|
    t.string   "gender"
    t.integer  "age"
    t.string   "phone"
    t.string   "email"
    t.text     "address"
    t.integer  "job_category_id"
    t.integer  "job_sub_category_id"
    t.string   "free_time"
    t.string   "language"
    t.string   "about_me"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "country"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "serching_job_in"
    t.string   "postal_code"
  end

  add_index "applicants", ["id"], :name => "index_applicants_on_id"

  create_table "employers", :force => true do |t|
    t.string   "phone"
    t.string   "email"
    t.text     "address"
    t.integer  "job_category_id"
    t.integer  "job_sub_category_id"
    t.string   "working_period"
    t.text     "about_job"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "work_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "business_name"
    t.string   "postal_code"
  end

  add_index "employers", ["id"], :name => "index_employers_on_id"

  create_table "images", :force => true do |t|
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.string   "image_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["parent_id"], :name => "index_images_on_parent_id"

  create_table "inquiries", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.integer  "position"
    t.boolean  "open",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "spam",       :default => false
  end

  create_table "inquiry_settings", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "destroyable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_categories", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_categories", ["id"], :name => "index_job_categories_on_id"

  create_table "job_sub_categories", :force => true do |t|
    t.string   "title"
    t.integer  "job_category_id"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_sub_categories", ["id"], :name => "index_job_sub_categories_on_id"

  create_table "page_parts", :force => true do |t|
    t.integer  "page_id"
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_parts", ["id"], :name => "index_page_parts_on_id"
  add_index "page_parts", ["page_id"], :name => "index_page_parts_on_page_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.integer  "parent_id"
    t.integer  "position"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.boolean  "show_in_menu",        :default => true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           :default => true
    t.string   "custom_title"
    t.string   "custom_title_type",   :default => "none"
    t.boolean  "draft",               :default => false
    t.string   "browser_title"
    t.boolean  "skip_to_first_child", :default => false
  end

  add_index "pages", ["id"], :name => "index_pages_on_id"
  add_index "pages", ["parent_id"], :name => "index_pages_on_parent_id"

  create_table "refinery_settings", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "destroyable",             :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "scoping"
    t.boolean  "restricted",              :default => false
    t.string   "callback_proc_as_string"
  end

  add_index "refinery_settings", ["name"], :name => "index_refinery_settings_on_name"

  create_table "resources", :force => true do |t|
    t.string   "content_type"
    t.string   "filename"
    t.integer  "size"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "title"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope",          :limit => 40
    t.datetime "created_at"
  end

  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "user_plugins", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "user_plugins", ["name"], :name => "index_user_plugins_on_name"
  add_index "user_plugins", ["user_id", "name"], :name => "index_unique_user_plugins", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login",             :null => false
    t.string   "email",             :null => false
    t.string   "crypted_password",  :null => false
    t.string   "password_salt",     :null => false
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "perishable_token"
  end

  add_index "users", ["id"], :name => "index_users_on_id"

end
