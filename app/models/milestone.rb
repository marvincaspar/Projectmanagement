class Milestone < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  has_and_belongs_to_many :product_breakdown_structures

  def self.order_for_selects(project_id)
    Milestone.where('project_id = ?', project_id).order('end_date')
  end
end
