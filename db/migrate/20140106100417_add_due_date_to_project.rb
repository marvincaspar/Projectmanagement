class AddDueDateToProject < ActiveRecord::Migration
  def change
    add_column :projects, :due, :datetime
  end
end
