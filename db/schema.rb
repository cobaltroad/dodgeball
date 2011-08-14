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

ActiveRecord::Schema.define(:version => 20110814210644) do

  create_table "leads", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.text     "notes"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.integer  "team_id"
    t.integer  "points"
    t.string   "name"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rules", :force => true do |t|
    t.integer  "object_id"
    t.string   "object_type"
    t.string   "trigger"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rule_type"
    t.integer  "threshold"
  end

  create_table "sales", :force => true do |t|
    t.string   "product_name"
    t.integer  "sale_amount_in_cents"
    t.text     "notes"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "positive_feedback"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
