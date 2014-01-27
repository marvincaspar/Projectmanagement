class Iteration < ActiveRecord::Base
  belongs_to :work_package
  has_many :estimations
end
