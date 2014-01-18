class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.string :name
      t.string :experience
      t.references :project, index: true
      t.references :user, index: true

      t.timestamps
    end

    add_index "qualifications", ["project_id"], name: "index_qualifications_on_project_id", using: :btree
    add_index "qualifications", ["user_id"], name: "index_qualifications_on_user_id", using: :btree
  end
end
