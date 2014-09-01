class RepositoriesController < ApplicationController
  protect_from_forgery except: :create

  # This method is only called from outside of the
  # application. It will be triggered by a github
  # webhook.
  # 
  # Also, note that this method creates no database records
  # in the Repository table. Instead it creates a new Release.
  #
  # The reason this intermediary model is needed is bacause the 
  # API will not know the ID of the project, only the name.
  # We need to look up the ID here.
  #
  def create
    repository = Repository.new(repository_params)
    render :nothing => true
    create_new_release(repository)
  end

  private
  def create_new_release(repository)
    project = Project.find_by(name: repository.project)
    if project
      release = Release.create(git_id: repository.git_hash, project_id: project.id)
    end 
  end

  def repository_params
    params.permit(:project, :git_hash)
  end
end
