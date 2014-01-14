class CreateResourceBreakdownStructures < ActiveRecord::Migration
  def change
    create_table :resource_breakdown_structures do |t|
      t.integer :resource_type
      t.string :role
      t.integer :count
      t.references :qualification, index: true
      t.integer :amount
      t.references :project, index: true

      t.timestamps
    end
  end
end
