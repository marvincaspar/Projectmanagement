class AddProjectToPbs < ActiveRecord::Migration
  def change
    add_column :product_breakdown_structures, :project_id, :integer
  end
end
