class ReleasesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @releases = @project.releases.all
  end

  def show
    @project = Project.find(params[:project_id])
    @release = @project.releases.find(params[:id])
  end
end
