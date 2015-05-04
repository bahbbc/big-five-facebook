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

ActiveRecord::Schema.define(version: 20150504020610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "personality_questions", force: :cascade do |t|
    t.integer  "one_speaker"
    t.integer  "two_show_defects"
    t.integer  "three_exaustive_work"
    t.integer  "four_sad"
    t.integer  "five_original"
    t.integer  "six_quiet"
    t.integer  "seven_prestative"
    t.integer  "eight_careless"
    t.integer  "nine_stressless"
    t.integer  "ten_curiosity"
    t.integer  "eleven_energy"
    t.integer  "twelve_fighter"
    t.integer  "thirteen_confidence_worker"
    t.integer  "fourteen_tense"
    t.integer  "fifteen_thinker"
    t.integer  "sixteen_enthusiastic"
    t.integer  "seventeen_forgive"
    t.integer  "eighteen_unorganized"
    t.integer  "ninteen_concerned"
    t.integer  "twenty_imaginative"
    t.integer  "twenty_one_calm"
    t.integer  "twenty_two_others_trust"
    t.integer  "twenty_three_lazy"
    t.integer  "twenty_four_stable"
    t.integer  "twenty_five_inventive"
    t.integer  "twenty_six_assertive"
    t.integer  "twenty_seven_cold"
    t.integer  "twenty_eight_perseverant"
    t.integer  "twenty_nine_instable"
    t.integer  "thrty_experience"
    t.integer  "thirty_one_shy"
    t.integer  "thirty_two_good"
    t.integer  "thirty_three_eficient"
    t.integer  "thirty_four_calm_in_tense"
    t.integer  "thirty_five_routine"
    t.integer  "thirty_six_friendly"
    t.integer  "thirty_seven_rude"
    t.integer  "thirty_eight_planner"
    t.integer  "thirty_nine_easily_nervous"
    t.integer  "fourty_like_think"
    t.integer  "fourty_one_low_artistic"
    t.integer  "fourty_two_cooperative"
    t.integer  "fourty_three_distractive"
    t.integer  "fourty_four_sofisticated"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "user_personalities", force: :cascade do |t|
    t.integer  "extraversion"
    t.integer  "agreeableness"
    t.integer  "conscientiousness"
    t.integer  "neuroticism"
    t.integer  "openness"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "email"
    t.string   "name"
  end

end
