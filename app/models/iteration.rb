class Iteration < ActiveRecord::Base
  belongs_to :work_package
  has_many :estimations, :order => 'created_at DESC'
end
