class Stage < ActiveRecord::Base
  belongs_to :project

  validates :name, presence: true, uniqueness: {scope: :project_id}
  validates :level, presence: true, uniqueness: {scope: :project_id}
  validates :command, presence: true
  validate :level_is_valid

  def level_is_valid
    true
  end
end
