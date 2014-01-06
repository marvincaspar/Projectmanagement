class User < ActiveRecord::Base
  extend Enumerize

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :product_breakdown_structures
  has_many :work_packages, :foreign_key => 'owner_id'

  enumerize :title, in: [:mister, :miss]
end
