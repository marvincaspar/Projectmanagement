class CreateResourceAllocationMatrices < ActiveRecord::Migration
  def change
    create_table :resource_allocation_matrices do |t|
      t.references :work_package
      t.references :resource_breakdown_structure
      t.references :product_breakdown_structure

      t.timestamps
    end

    add_index "resource_allocation_matrices", ["work_package_id", "resource_breakdown_structure_id", "product_breakdown_structure_id"], name: "index_resource_allocation_matrices", using: :btree
  end
end
