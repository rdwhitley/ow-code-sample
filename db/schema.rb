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

ActiveRecord::Schema.define(version: 2022_10_09_054636) do

  create_table "parts", force: :cascade do |t|
    t.string "sku"
    t.string "display_pn"
    t.string "be_product_cat_name"
    t.string "short_description"
    t.string "lead_time"
    t.string "meta_description"
    t.string "meta_title"
    t.string "part_status"
    t.text "images"
    t.text "part_attributes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
