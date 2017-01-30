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

ActiveRecord::Schema.define(version: 20170127201931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ajax_tests", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competencies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "description"
    t.integer  "competency_type_id"
    t.index ["competency_type_id"], name: "index_competencies_on_competency_type_id", using: :btree
  end

  create_table "competency_levels", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "competency_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partner_levels", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "partner_memberships", force: :cascade do |t|
    t.integer  "partner_id"
    t.integer  "competency_id"
    t.integer  "competency_level_id"
    t.integer  "num_vse"
    t.integer  "num_vseplus"
    t.integer  "num_vcs"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["partner_id", "competency_id"], name: "index_partner_memberships_on_partner_id_and_competency_id", using: :btree
  end

  create_table "partners", force: :cascade do |t|
    t.string   "name"
    t.string   "pnet_acct"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "partner_level_id"
    t.index ["partner_level_id"], name: "index_partners_on_partner_level_id", using: :btree
    t.index ["pnet_acct"], name: "index_partners_on_pnet_acct", using: :btree
  end

end
