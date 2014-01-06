class Project < ActiveRecord::Base
  belongs_to :user
  has_many :project_breakdown_structures
  has_many :resource_breakdown_structures
  has_many :resource_breakdown_structures
end
