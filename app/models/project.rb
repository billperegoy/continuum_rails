class Project < ActiveRecord::Base
  has_many :stages
  has_many :releases

  validates :name, presence: true, uniqueness: true
  validates :path, presence: true, uniqueness: true
  validates :path, format: { with: /\A\w+\/\w+\z/,
    message: 'must be <repos>/<proj>' }
  validate :path_must_exist_as_github_project

  def path_must_exist_as_github_project
    github = Github.new
    user = path.split('/')[0]
    repos_list = github.repos.list(user: user)
    unless repos_exist?(repos_list.body, path)
      errors.add(:path, "Must exist in github")
    end
  end

  def repos_exist?(body, path)
    body.each do |elem|
      return true if elem.full_name == path
    end
    return false
  end
end
