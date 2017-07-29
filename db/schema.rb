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

ActiveRecord::Schema.define(version: 20170716215541) do

  create_table "answers", force: :cascade do |t|
    t.integer  "formulario_field_id", limit: 4
    t.integer  "formulario_p_id",     limit: 4
    t.string   "valor",               limit: 255
    t.string   "file",                limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "answers", ["formulario_field_id"], name: "index_answers_on_formulario_field_id", using: :btree
  add_index "answers", ["formulario_p_id"], name: "index_answers_on_formulario_p_id", using: :btree

  create_table "contact_groups", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "contact_groups_destinos", id: false, force: :cascade do |t|
    t.integer "contact_group_id", limit: 4, null: false
    t.integer "destino_id",       limit: 4, null: false
  end

  add_index "contact_groups_destinos", ["contact_group_id", "destino_id"], name: "index_contact_groups_destinos_on_contact_group_id_and_destino_id", using: :btree
  add_index "contact_groups_destinos", ["destino_id", "contact_group_id"], name: "index_contact_groups_destinos_on_destino_id_and_contact_group_id", using: :btree

  create_table "contact_groups_formularios", id: false, force: :cascade do |t|
    t.integer "contact_group_id", limit: 4, null: false
    t.integer "formulario_id",    limit: 4, null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "destinos", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "email",      limit: 255
    t.string   "celular",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "field_types", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "filial_formularios", force: :cascade do |t|
    t.integer  "formulario_id", limit: 4
    t.integer  "filial_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "filial_formularios", ["filial_id"], name: "index_filial_formularios_on_filial_id", using: :btree
  add_index "filial_formularios", ["formulario_id"], name: "index_filial_formularios_on_formulario_id", using: :btree

  create_table "filials", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "formulario_fields", force: :cascade do |t|
    t.string   "label",         limit: 255
    t.integer  "formulario_id", limit: 4
    t.integer  "field_type_id", limit: 4
    t.integer  "requirido",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "options",       limit: 255
    t.string   "url",           limit: 255
  end

  create_table "formulario_ps", force: :cascade do |t|
    t.integer  "formulario_id",       limit: 4
    t.integer  "formulario_field_id", limit: 4
    t.integer  "user_id",             limit: 4
    t.string   "valor",               limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "file",                limit: 255
    t.boolean  "sync",                            default: false
  end

  add_index "formulario_ps", ["formulario_field_id"], name: "index_formulario_ps_on_formulario_field_id", using: :btree
  add_index "formulario_ps", ["formulario_id"], name: "index_formulario_ps_on_formulario_id", using: :btree
  add_index "formulario_ps", ["user_id"], name: "index_formulario_ps_on_user_id", using: :btree

  create_table "formularios", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantidade", limit: 4
    t.integer  "filial_id",  limit: 4
  end

  add_index "formularios", ["filial_id"], name: "index_formularios_on_filial_id", using: :btree

  create_table "logos", force: :cascade do |t|
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.integer  "answer_id",  limit: 4
    t.string   "file",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "pictures", ["answer_id"], name: "index_pictures_on_answer_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "nome",                   limit: 255
    t.integer  "filial_id",              limit: 4
    t.integer  "tipo",                   limit: 4
    t.string   "auth_token",             limit: 255
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["filial_id"], name: "index_users_on_filial_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "answers", "formulario_fields"
  add_foreign_key "answers", "formulario_ps"
  add_foreign_key "filial_formularios", "filials"
  add_foreign_key "filial_formularios", "formularios"
  add_foreign_key "formulario_ps", "formulario_fields"
  add_foreign_key "formulario_ps", "formularios"
  add_foreign_key "pictures", "answers"
end
