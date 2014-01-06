class CreateResourceBreakdownStructures < ActiveRecord::Migration
  def change
    create_table :resource_breakdown_structures do |t|
      t.integer :type
      t.references :role, index: true
      t.integer :count
      t.references :qualification, index: true
      t.integer :amount
      t.references :project, index: true

      t.timestamps
    end
  end
end
