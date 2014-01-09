class AddUserToWbs < ActiveRecord::Migration
  def change
    add_column :work_breakdown_structures, :user_id, :integer
  end
end
