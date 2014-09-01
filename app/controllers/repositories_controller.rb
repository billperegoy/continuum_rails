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
    repository = Repository.new
    render :nothing => true
    body = JSON.parse(request.body.read);
    repository = body['repository']['name']
    git_hash = body['head_commit']['id']
    create_new_release(repository, git_hash)
  end

  private
  def create_new_release(repository, git_hash)
    Release.create(git_id: repository, project_id: 1)
    Release.create(git_id: git_hash, project_id: 1)
  end
end
