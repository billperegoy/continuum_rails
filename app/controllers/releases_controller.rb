class ReleasesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @releases = @project.releases.all
  end
end
