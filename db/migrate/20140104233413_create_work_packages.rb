class CreateWorkPackages < ActiveRecord::Migration
  def change
    create_table :work_packages do |t|
      t.string :name
      t.references :owner, index: true
      t.references :released_by, index: true
      t.datetime :released_on
      t.text :description
      t.text :target
      t.text :resources
      t.text :risks
      t.references :work_breakdown_strukture, index: true
      t.datetime :start
      t.datetime :end
      t.integer :cost
      t.integer :parent
      t.references :project, index: true

      t.timestamps
    end
  end
end
