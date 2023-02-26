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

ActiveRecord::Schema[7.0].define(version: 2022_12_03_160936) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "patients", force: :cascade do |t|
    t.string "lastname"
    t.string "firstname"
    t.datetime "data_nasterii"
    t.integer "varsta"
    t.string "sex"
    t.string "cnp"
    t.string "serie_nr_buletin"
    t.string "localitate"
    t.string "judet"
    t.string "adresa"
    t.string "email"
    t.string "grup_sangvin"
    t.float "greutate"
    t.float "inaltime"
    t.boolean "rh"
    t.string "alergii"
    t.string "ocupatie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "user_id", null: false
    t.string "judet_spital"
    t.string "localitate_spital"
    t.string "spital"
    t.string "sectia"
    t.boolean "internat_urgenta"
    t.date "data_internarii"
    t.time "ora_internarii"
    t.date "data_externarii"
    t.time "ora_externarii"
    t.integer "numar_zile_spitalizare"
    t.integer "numar_zile_concediu"
    t.string "numar_talon_pensie"
    t.text "diagnostic_de_trimitere"
    t.text "diagnostic_la_internare"
    t.text "diagnostic_la_72_ore"
    t.text "diagnostic_externare_principal"
    t.text "diagnostic_externare_boli"
    t.text "interventie_tehnica"
    t.text "interventie_boala"
    t.date "interventie_data"
    t.string "stare_la_externare"
    t.text "decedat"
    t.text "diagnostic_anatomo_patologic"
    t.text "observatie_clinica"
    t.date "observatie_data"
    t.text "examinari_de_specialitate"
    t.text "examene_cerute"
    t.string "examen_oncologic_cavitate_bucala"
    t.string "examen_oncologic_tegumente"
    t.string "examen_oncologic_ganglionare"
    t.string "examen_oncologic_san"
    t.string "examen_oncologic_genital_feminin"
    t.string "examen_oncologic_citologie_secretie"
    t.string "examen_oncologic_prostata_rect"
    t.string "examen_oncologic_alte"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_records_on_patient_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nume"
    t.string "prenume"
    t.string "parafa"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "records", "patients"
  add_foreign_key "records", "users"
end
