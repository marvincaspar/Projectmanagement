class Comment < ActiveRecord::Base
  belongs_to :estimation
  belongs_to :user
end
