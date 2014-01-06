class WorkBreakdownStructure < ActiveRecord::Base
  belongs_to :project
  has_many :work_packages
end
