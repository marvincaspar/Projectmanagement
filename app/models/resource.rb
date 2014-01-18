class Resource < ActiveRecord::Base
  belongs_to :qualification
  belongs_to :resource_breakdown_structure
  belongs_to :user
  belongs_to :project
end
