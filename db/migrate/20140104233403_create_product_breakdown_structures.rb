class CreateProductBreakdownStructures < ActiveRecord::Migration
  def change
    create_table :product_breakdown_structures do |t|
      t.string :name
      t.integer :level
      t.integer :parent
      t.integer :order
      t.references :user, index: true

      t.timestamps
    end
  end
end
