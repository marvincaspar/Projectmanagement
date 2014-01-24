class Project < ActiveRecord::Base
  resourcify
  belongs_to :user
  has_many :product_breakdown_structures
  has_many :work_breakdown_structures
  has_many :resource_breakdown_structures
  has_many :resource_allocation_matrices
  has_many :milestones
end
