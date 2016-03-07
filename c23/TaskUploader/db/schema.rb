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

ActiveRecord::Schema.define(version: 20160307150201) do

  create_table "solutions", force: :cascade do |t|
    t.integer  "task_id"
    t.text     "code"
    t.text     "author"
    t.integer  "automatic_score"
  	t.integer  "manual_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "tests_output"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text   "description"
    t.text   "tests"
  end

end
