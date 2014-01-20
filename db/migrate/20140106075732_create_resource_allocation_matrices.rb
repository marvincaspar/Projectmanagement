class CreateResourceAllocationMatrices < ActiveRecord::Migration
  def change
    create_table :resource_allocation_matrices do |t|
      t.references :work_package
      t.references :resource_breakdown_structure
      t.references :product_breakdown_structure
      t.references :project
      
      t.timestamps
    end
  end
end
