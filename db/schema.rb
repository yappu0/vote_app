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

ActiveRecord::Schema[7.0].define(version: 2023_05_12_012500) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluation_items", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_evaluation_items_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.string "password", null: false
    t.integer "point", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "evaluation_item_id", null: false
    t.bigint "vote_id", null: false
    t.integer "point", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_item_id"], name: "index_scores_on_evaluation_item_id"
    t.index ["team_id"], name: "index_scores_on_team_id"
    t.index ["vote_id"], name: "index_scores_on_vote_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_teams_on_event_id"
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_votes_on_event_id"
  end

  add_foreign_key "evaluation_items", "events"
  add_foreign_key "scores", "evaluation_items"
  add_foreign_key "scores", "teams"
  add_foreign_key "scores", "votes"
  add_foreign_key "teams", "events"
  add_foreign_key "votes", "events"
end
