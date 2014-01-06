class RemoveUserFromWbs < ActiveRecord::Migration
  def change
    remove_column :work_breakdown_structures, :user_id
  end
end
