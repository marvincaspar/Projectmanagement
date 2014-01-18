class WorkPackage < ActiveRecord::Base
  extend Enumerize
  
  belongs_to :owner, class_name: "User"
  belongs_to :released_by, class_name: "User"
  belongs_to :work_breakdown_structure
  belongs_to :project

  enumerize :risk, in: { low: 1,
                         medium: 2,
                         high: 3 },
                    default: :medium,
                    predicates: { prefix: true }
end
