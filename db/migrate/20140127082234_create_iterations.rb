class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.references :work_package, index: true
      t.boolean :open, default: true

      t.timestamps
    end
  end
end
