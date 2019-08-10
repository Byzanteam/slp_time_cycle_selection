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

ActiveRecord::Schema.define(version: 2019_08_10_073721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "slp_time_cycle_selection_periodic_module_dates", force: :cascade do |t|
    t.integer "name"
    t.string "type"
    t.bigint "periodic_module_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["periodic_module_id"], name: "periodic_module_dates_on_periodic_module_id"
  end

  create_table "slp_time_cycle_selection_periodic_module_options", force: :cascade do |t|
    t.bigint "periodic_module_date_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "upper_limit"
    t.string "option", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["periodic_module_date_id"], name: "periodic_module_options_on_periodic_module_date_id"
  end

  create_table "slp_time_cycle_selection_periodic_modules", force: :cascade do |t|
    t.string "name"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_slp_time_cycle_selection_periodic_modules_on_project_id"
  end

  create_table "slp_time_cycle_selection_projects", force: :cascade do |t|
    t.string "name"
    t.integer "delay_minutes", default: 0
    t.integer "delay_minute_unit", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
