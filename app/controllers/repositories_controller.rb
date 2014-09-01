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

    release_fields = {
      project_name: body['repository']['name'],
      repository: body['repository']['full_name'],
      git_id: body['head_commit']['id'],
      commit_message: body['head_commit']['message'],
      commit_timestamp: Date.parse(body['head_commit']['timestamp']),
      committer_name: body['head_commit']['committer']['name']
    }

    create_new_release(release_fields)
  end

  private
  def create_new_release(fields)
    project = Project.find_by(name: fields[:project_name])
    if project
      Release.create(project_id: project.id,
                     git_id: fields[:git_id],
                     commit_message: fields[:commit_message],
                     commit_timestamp: fields[:commit_timestamp],
                     committer_name: fields[:committer_name]
                    )
    end
  end
end
