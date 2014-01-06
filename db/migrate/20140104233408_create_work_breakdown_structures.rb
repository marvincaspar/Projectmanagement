class CreateWorkBreakdownStructures < ActiveRecord::Migration
  def change
    create_table :work_breakdown_structures do |t|
      t.string :name
      t.integer :level
      t.integer :parent
      t.integer :order
      t.references :user, index: true
      t.integer :type
      t.references :project, index: true

      t.timestamps
    end
  end
end
