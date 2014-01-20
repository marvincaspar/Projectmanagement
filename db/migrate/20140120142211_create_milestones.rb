class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.references :project, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
