class Project < ActiveRecord::Base
  has_many :stages
  has_many :releases
end
