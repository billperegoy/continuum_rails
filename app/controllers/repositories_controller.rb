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
    body = request.raw_post
    create_new_release(body)
  end

  private
  def create_new_release(body)
    id = "hello3"
    release = Release.create(git_id: id, project_id: 1)
    release = Release.create(git_id: body, project_id: 1)
  end
end
