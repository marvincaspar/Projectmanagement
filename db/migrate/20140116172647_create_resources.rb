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
  end
end
