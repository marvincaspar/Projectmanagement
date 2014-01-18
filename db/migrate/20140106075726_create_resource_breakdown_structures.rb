class CreateResourceBreakdownStructures < ActiveRecord::Migration
  def change
    create_table :resource_breakdown_structures do |t|
      t.string :name
      t.integer :level
      t.integer :parent
      t.integer :order
      t.references :user, index: true
      t.integer :resource
      t.integer :resource_type
      t.references :project, index: true

      t.timestamps
    end

    add_index "resource_breakdown_structures", ["project_id"], name: "index_resource_breakdown_structures_on_project_id", using: :btree
    add_index "resource_breakdown_structures", ["user_id"], name: "index_resource_breakdown_structures_on_user_id", using: :btree
  end
end


# class CreateResourceBreakdownStructures < ActiveRecord::Migration
#   def change
#     create_table :resource_breakdown_structures do |t|
#       t.integer :resource_type
#       t.string :role
#       t.integer :count
#       t.references :qualification, index: true
#       t.integer :amount
#       t.references :project, index: true

#       t.timestamps
#     end
#   end
# end
