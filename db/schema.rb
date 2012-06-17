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

ActiveRecord::Schema.define(:version => 20120611215829) do

  create_table "blocks", :force => true do |t|
    t.text     "content"
    t.string   "block_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "callback_requests", :force => true do |t|
    t.string   "phone"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "car_assets", :force => true do |t|
    t.string   "file"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.integer  "user_id"
    t.integer  "car_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "cars", :force => true do |t|
    t.string   "god"
    t.string   "marka"
    t.string   "model"
    t.string   "dvigatel"
    t.string   "tip"
    t.string   "moschnost"
    t.string   "privod"
    t.string   "tip_kuzova"
    t.string   "kpp"
    t.string   "kod_kuzova"
    t.string   "kod_dvigatelya"
    t.string   "rinok"
    t.string   "vin"
    t.string   "frame"
    t.string   "komplektaciya"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "links", :force => true do |t|
    t.integer  "user_id"
    t.string   "url"
    t.text     "search_address_logic"
    t.text     "template_to_search"
    t.datetime "last_date_check"
    t.datetime "last_successful_date_check"
    t.integer  "fail_sequence_counter",      :default => 0
    t.string   "notes"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "message_assets", :force => true do |t|
    t.string   "file"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.integer  "message_id"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "messages", :force => true do |t|
    t.text     "message"
    t.boolean  "notified",   :default => false
    t.integer  "request_id"
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "status",        :default => "awaiting"
    t.text     "notes"
    t.boolean  "notified",      :default => false
    t.integer  "user_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "delivery_cost"
  end

  create_table "pages", :force => true do |t|
    t.string   "path"
    t.text     "default_content"
    t.text     "mobile_content"
    t.text     "keyword"
    t.text     "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "title"
    t.string   "robots"
  end

  create_table "parts_images", :force => true do |t|
    t.string   "part_image"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "catalog_number"
    t.string   "manufacturer"
  end

  create_table "requests", :force => true do |t|
    t.integer  "car_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "search_histories", :force => true do |t|
    t.integer  "user_id"
    t.string   "session_id"
    t.string   "catalog_number"
    t.string   "manufacturer"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "searches", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "phone"
    t.string   "name"
    t.string   "user_name"
    t.boolean  "admin"
    t.integer  "balance",                               :default => 0
    t.integer  "discount",                              :default => 0
  end

  add_index "users", ["admin"], :name => "index_users_on_admin"
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["phone"], :name => "index_users_on_phone", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "wishes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "cost"
    t.string   "catalog_number"
    t.string   "manufacturer"
    t.string   "title"
    t.string   "count"
    t.string   "declared"
    t.string   "average"
    t.string   "country"
    t.string   "session_id"
    t.string   "status",          :default => "active"
    t.integer  "order_id"
    t.integer  "count_in_wishes", :default => 0
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

end
