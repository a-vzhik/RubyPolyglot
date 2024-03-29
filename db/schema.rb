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

ActiveRecord::Schema.define(version: 20140201142618) do

  create_table "term_requests", force: true do |t|
    t.text "term",            null: false
    t.text "source_language", null: false
    t.text "target_language", null: false
    t.text "service",         null: false
  end

  create_table "translation_service_languages", primary_key: "translation_service_id", force: true do |t|
    t.text "source_language", null: false
    t.text "target_language", null: false
  end

  create_table "translation_services", force: true do |t|
    t.text "name", null: false
    t.text "url",  null: false
  end

end
