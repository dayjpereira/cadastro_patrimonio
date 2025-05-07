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

ActiveRecord::Schema[7.2].define(version: 2025_05_06_031137) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departamentos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "nome"
    t.bigint "departamento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departamento_id"], name: "index_funcionarios_on_departamento_id"
  end

  create_table "patrimonios", force: :cascade do |t|
    t.string "nome"
    t.string "numero_placa"
    t.decimal "valor"
    t.date "data_compra"
    t.text "descricao"
    t.bigint "funcionario_id", null: false
    t.bigint "departamento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departamento_id"], name: "index_patrimonios_on_departamento_id"
    t.index ["funcionario_id"], name: "index_patrimonios_on_funcionario_id"
  end

  add_foreign_key "funcionarios", "departamentos"
  add_foreign_key "patrimonios", "departamentos"
  add_foreign_key "patrimonios", "funcionarios"
end
