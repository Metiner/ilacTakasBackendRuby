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

ActiveRecord::Schema.define(version: 20181002085909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alims", force: :cascade do |t|
    t.integer "miktar", null: false
    t.datetime "tarih"
    t.boolean "gonderildi"
    t.boolean "teslim_alindi"
    t.jsonb "karekodlar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teklif_id"
    t.bigint "eczane_id"
    t.index ["eczane_id"], name: "index_alims_on_eczane_id"
    t.index ["teklif_id"], name: "index_alims_on_teklif_id"
  end

  create_table "bakiyes", force: :cascade do |t|
    t.decimal "tutar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "eczane_id"
    t.index ["eczane_id"], name: "index_bakiyes_on_eczane_id"
  end

  create_table "eczanes", force: :cascade do |t|
    t.string "ad", null: false
    t.string "gln_no", null: false
    t.decimal "bakiye", default: "0.0"
    t.integer "actigi_teklif_sayisi", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "grup_id"
    t.bigint "user_id"
    t.index ["grup_id"], name: "index_eczanes_on_grup_id"
    t.index ["user_id"], name: "index_eczanes_on_user_id"
  end

  create_table "grups", force: :cascade do |t|
    t.string "ad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teklifs", force: :cascade do |t|
    t.string "barcode", null: false
    t.integer "alim_miktari", null: false
    t.integer "mal_fazlasi", null: false
    t.integer "min_alim", null: false
    t.integer "max_alim", null: false
    t.integer "hedeflenen_alim", null: false
    t.datetime "baslangic_tarihi", null: false
    t.datetime "bitis_tarihi", null: false
    t.datetime "son_kul_tarihi", null: false
    t.decimal "etiket_fiyati", null: false
    t.decimal "depo_fiyati", null: false
    t.decimal "net_fiyat", null: false
    t.boolean "hedeflenen_alim_gecilsin", default: false
    t.boolean "eczaneye_ozel", default: false
    t.string "ozel_eczane_id"
    t.integer "alinmis_miktar", default: 0
    t.string "yemek_ceki_elden_nakit"
    t.string "ekstra_urun"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "eczane_id"
    t.index ["eczane_id"], name: "index_teklifs_on_eczane_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.bigint "eczane_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["eczane_id"], name: "index_users_on_eczane_id"
  end

end
