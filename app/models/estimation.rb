class Estimation < ActiveRecord::Base
  belongs_to :iteration
  belongs_to :user
  has_many :comments
end
