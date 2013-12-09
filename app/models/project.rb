class Project < ActiveRecord::Base
  has_many :packages
end
