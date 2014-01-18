class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.references :qualification, index: true
      t.references :resource_breakdown_structure, index: true
      t.references :user, index: true
      t.references :project, index: true
      t.integer :count
      t.float :amount

      t.timestamps
    end

    add_index "resources", ["qualification_id"], name: "index_resources_on_qualification_id", using: :btree
    add_index "resources", ["resource_breakdown_structure_id"], name: "index_resources_on_resource_breakdown_structure_id", using: :btree
    add_index "resources", ["user_id"], name: "index_resources_on_user_id", using: :btree
    add_index "resources", ["project_id"], name: "index_resources_on_project_id", using: :btree
  end
end
