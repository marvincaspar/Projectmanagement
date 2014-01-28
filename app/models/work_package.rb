class WorkPackage < ActiveRecord::Base
  extend Enumerize
  after_create :add_iteration

  belongs_to :user
  belongs_to :released_by, class_name: "User"
  belongs_to :work_breakdown_structure
  has_one :resource_allocation_matrix
  belongs_to :project
  has_many :iterations

  enumerize :risk, in: { low: 1,
                         medium: 2,
                         high: 3 },
                    default: :medium,
                    predicates: { prefix: true }

  private
    def add_iteration
      Iteration.create work_package_id: self.id
    end
end
