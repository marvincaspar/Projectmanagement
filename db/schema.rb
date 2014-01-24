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

ActiveRecord::Schema.define(version: 20140120142538) do

  create_table "attachments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "attachments_work_packages", id: false, force: true do |t|
    t.integer "attachment_id",   null: false
    t.integer "work_package_id", null: false
  end

  create_table "milestones", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "milestones", ["project_id"], name: "index_milestones_on_project_id", using: :btree
  add_index "milestones", ["user_id"], name: "index_milestones_on_user_id", using: :btree

  create_table "milestones_product_breakdown_structures", id: false, force: true do |t|
    t.integer "milestone_id",                   null: false
    t.integer "product_breakdown_structure_id", null: false
  end

  create_table "product_breakdown_structures", force: true do |t|
    t.string   "name"
    t.integer  "level"
    t.integer  "parent"
    t.integer  "order"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  add_index "product_breakdown_structures", ["user_id"], name: "index_product_breakdown_structures_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "due"
  end

  create_table "qualifications", force: true do |t|
    t.string   "name"
    t.string   "experience"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "qualifications", ["project_id"], name: "index_qualifications_on_project_id", using: :btree
  add_index "qualifications", ["user_id"], name: "index_qualifications_on_user_id", using: :btree

  create_table "resource_allocation_matrices", force: true do |t|
    t.integer  "work_package_id"
    t.integer  "resource_breakdown_structure_id"
    t.integer  "product_breakdown_structure_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resource_allocation_matrices", ["work_package_id", "resource_breakdown_structure_id", "product_breakdown_structure_id"], name: "index_resource_allocation_matrices", using: :btree

  create_table "resource_breakdown_structures", force: true do |t|
    t.string   "name"
    t.integer  "level"
    t.integer  "parent"
    t.integer  "order"
    t.integer  "user_id"
    t.integer  "resource"
    t.integer  "resource_type"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resource_breakdown_structures", ["project_id"], name: "index_resource_breakdown_structures_on_project_id", using: :btree
  add_index "resource_breakdown_structures", ["user_id"], name: "index_resource_breakdown_structures_on_user_id", using: :btree

  create_table "resources", force: true do |t|
    t.integer  "qualification_id"
    t.integer  "resource_breakdown_structure_id"
    t.integer  "count"
    t.float    "amount"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["project_id"], name: "index_resources_on_project_id", using: :btree
  add_index "resources", ["qualification_id"], name: "index_resources_on_qualification_id", using: :btree
  add_index "resources", ["resource_breakdown_structure_id"], name: "index_resources_on_resource_breakdown_structure_id", using: :btree
  add_index "resources", ["user_id"], name: "index_resources_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "title"
    t.string   "phone"
    t.string   "mobile"
    t.string   "department"
    t.string   "position"
    t.string   "location"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "work_breakdown_structures", force: true do |t|
    t.string   "name"
    t.integer  "level"
    t.integer  "parent"
    t.integer  "order"
    t.integer  "type"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "work_breakdown_structures", ["project_id"], name: "index_work_breakdown_structures_on_project_id", using: :btree

  create_table "work_packages", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "released_by_id"
    t.datetime "released_on"
    t.text     "description"
    t.text     "target"
    t.text     "resources"
    t.integer  "risk"
    t.integer  "work_breakdown_structure_id"
    t.date     "start"
    t.date     "end"
    t.integer  "cost"
    t.integer  "parent"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "work_packages", ["user_id"], name: "index_work_packages_on_user_id", using: :btree
  add_index "work_packages", ["project_id"], name: "index_work_packages_on_project_id", using: :btree
  add_index "work_packages", ["released_by_id"], name: "index_work_packages_on_released_by_id", using: :btree
  add_index "work_packages", ["work_breakdown_structure_id"], name: "index_work_packages_on_work_breakdown_structure_id", using: :btree

end
