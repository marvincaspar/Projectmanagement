class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :title
      t.references :project, index: true
      t.references :prev_package, index: true
      t.references :employee, index: true
      t.references :risk, index: true

      t.timestamps
    end
  end
end
