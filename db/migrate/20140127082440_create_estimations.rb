class CreateEstimations < ActiveRecord::Migration
  def change
    create_table :estimations do |t|
      t.references :iteration, index: true
      t.references :user, index: true
      t.integer :effort

      t.timestamps
    end
  end
end
