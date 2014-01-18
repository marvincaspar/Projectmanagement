class Qualification < ActiveRecord::Base
  has_many :resources
  belongs_to :project
  belongs_to :user

  def name_for_selects
    "#{name}: #{experience}".html_safe
  end
end
