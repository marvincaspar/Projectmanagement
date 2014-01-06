class ResourceBreakdownStructure < ActiveRecord::Base
  resourcify
  #belongs_to :role
  belongs_to :qualification
  belongs_to :project
end
