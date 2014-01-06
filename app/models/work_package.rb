class WorkPackage < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :released_by, class_name: "User"
  belongs_to :work_breakdown_strukture
  belongs_to :project
end
