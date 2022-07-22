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

ActiveRecord::Schema.define(version: 2022_07_22_130002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enderecos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "municipe_id", null: false
    t.string "cep", null: false
    t.string "logradouro", null: false
    t.string "complemento"
    t.string "bairro", null: false
    t.string "cidade", null: false
    t.string "uf", null: false
    t.integer "codigo_ibge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cep"], name: "index_enderecos_on_cep"
    t.index ["municipe_id"], name: "index_enderecos_on_municipe_id"
  end

  create_table "municipes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome_completo", null: false
    t.string "cpf", null: false
    t.string "cns", null: false
    t.string "email", null: false
    t.datetime "data_de_nascimento", null: false
    t.string "telefone", null: false
    t.boolean "status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "foto_file_name"
    t.string "foto_content_type"
    t.bigint "foto_file_size"
    t.datetime "foto_updated_at"
    t.index ["cns"], name: "index_municipes_on_cns"
    t.index ["cpf"], name: "index_municipes_on_cpf"
    t.index ["email"], name: "index_municipes_on_email"
    t.index ["status"], name: "index_municipes_on_status"
  end

  add_foreign_key "enderecos", "municipes"
end
