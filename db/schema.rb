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

ActiveRecord::Schema.define(version: 20150912063340) do

  create_table "exifs", force: :cascade do |t|
    t.string   "camera"
    t.string   "software"
    t.integer  "iso"
    t.string   "shutter"
    t.string   "aperture"
    t.datetime "taken"
    t.string   "exposure_bias"
    t.boolean  "flash"
    t.string   "focal_length"
    t.string   "lens"
    t.integer  "image_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "exifs", ["image_id"], name: "index_exifs_on_image_id"

  create_table "images", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
  end

end
