# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_28_182313) do

  create_table "locations", force: :cascade do |t|
    t.text "name"
    t.text "city"
    t.text "country"
    t.text "best_season_to_visit"
  end

  create_table "movie_locations", force: :cascade do |t|
    t.integer "movie_id"
    t.text "scene_description"
    t.integer "location_id"
  end

  create_table "movies", force: :cascade do |t|
    t.text "name"
    t.text "movie_or_tvshow"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "movie_location_id"
    t.text "review"
    t.integer "rating"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "username"
  end

end
