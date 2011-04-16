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

ActiveRecord::Schema.define(:version => 20110416183843) do

  create_table "stations", :force => true do |t|
    t.string   "line"
    t.string   "platform_key"
    t.string   "platform_name"
    t.string   "station_name"
    t.integer  "platform_order"
    t.string   "start_of_line"
    t.string   "end_of_line"
    t.string   "branch"
    t.string   "direction"
    t.string   "stop_id"
    t.string   "stop_code"
    t.string   "stop_name"
    t.string   "stop_desc"
    t.float    "stop_lat"
    t.float    "stop_lon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trains", :force => true do |t|
    t.string   "line"
    t.string   "trip"
    t.string   "platform_key"
    t.string   "information_type"
    t.string   "arrived"
    t.string   "time"
    t.string   "time_remaining"
    t.string   "revenue"
    t.string   "route"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
