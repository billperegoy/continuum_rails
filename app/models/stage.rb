class Stage < ActiveRecord::Base
  belongs_to :project

  validates :name, presence: true, uniqueness: true
  validates :level, presence: true, uniqueness: true
  validates :command, presence: true
end
