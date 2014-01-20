class MilestonePbsRelation < ActiveRecord::Migration
  def change
    create_join_table :milestones, :product_breakdown_structures
  end
end
