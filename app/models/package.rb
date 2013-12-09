class Package < ActiveRecord::Base
  belongs_to :project
  belongs_to :prev_package, class_name: 'Package'
  belongs_to :employee, class_name: 'User'
  belongs_to :risk
end
