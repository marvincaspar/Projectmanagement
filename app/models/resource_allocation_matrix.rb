class ResourceAllocationMatrix < ActiveRecord::Base
  belongs_to :work_package
  belongs_to :resource_breakdown_structure
  belongs_to :product_breakdown_structure
  belongs_to :project
end
