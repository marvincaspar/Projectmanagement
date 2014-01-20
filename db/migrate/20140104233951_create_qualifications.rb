class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.string :name
      t.string :experience
      t.references :project, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
