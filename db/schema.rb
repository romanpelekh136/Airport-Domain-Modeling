# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2026_02_11_161917) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "aircrafts", force: :cascade do |t|
    t.string "serial_number"
    t.bigint "airline_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airline_id"], name: "index_aircrafts_on_airline_id"
  end

  create_table "airlines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checkin_counters", force: :cascade do |t|
    t.string "code"
    t.bigint "terminal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["terminal_id"], name: "index_checkin_counters_on_terminal_id"
  end

  create_table "flight_instances", force: :cascade do |t|
    t.bigint "flight_id", null: false
    t.bigint "aircraft_id", null: false
    t.datetime "scheduled_departure_at", null: false
    t.datetime "scheduled_arrival_at", null: false
    t.string "status", default: "scheduled", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aircraft_id"], name: "index_flight_instances_on_aircraft_id"
    t.index ["flight_id"], name: "index_flight_instances_on_flight_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "flight_number"
    t.bigint "airline_id", null: false
    t.bigint "origin_airport_id", null: false
    t.bigint "destination_airport_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airline_id"], name: "index_flights_on_airline_id"
    t.index ["destination_airport_id"], name: "index_flights_on_destination_airport_id"
    t.index ["origin_airport_id"], name: "index_flights_on_origin_airport_id"
  end

  create_table "gate_assignments", force: :cascade do |t|
    t.bigint "gate_id", null: false
    t.bigint "flight_instance_id", null: false
    t.datetime "active_from"
    t.datetime "active_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_instance_id"], name: "index_gate_assignments_on_flight_instance_id"
    t.index ["gate_id"], name: "index_gate_assignments_on_gate_id"
  end

  create_table "gates", force: :cascade do |t|
    t.string "code"
    t.bigint "terminal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["terminal_id"], name: "index_gates_on_terminal_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "seat_number"
    t.string "cabin_class"
    t.bigint "aircraft_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aircraft_id"], name: "index_seats_on_aircraft_id"
  end

  create_table "terminals", force: :cascade do |t|
    t.string "code"
    t.bigint "airport_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airport_id"], name: "index_terminals_on_airport_id"
  end

  add_foreign_key "aircrafts", "airlines"
  add_foreign_key "checkin_counters", "terminals"
  add_foreign_key "flight_instances", "aircrafts"
  add_foreign_key "flight_instances", "flights"
  add_foreign_key "flights", "airlines"
  add_foreign_key "flights", "airports", column: "destination_airport_id"
  add_foreign_key "flights", "airports", column: "origin_airport_id"
  add_foreign_key "gate_assignments", "flight_instances"
  add_foreign_key "gate_assignments", "gates"
  add_foreign_key "gates", "terminals"
  add_foreign_key "seats", "aircrafts"
  add_foreign_key "terminals", "airports"
end
