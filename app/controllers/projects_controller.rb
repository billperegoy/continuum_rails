class ProjectsController < ApplicationController
  respond_to :html, :js
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        @projects = Project.all
        format.js {}
      else
        render :new
        format.js {}
      end
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.update(project_params)
        @projects = Project.all
        format.js {}
      else
        render :edit
      end
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    respond_to do |format|
      @project = Project.delete(params[:id])
      @projects = Project.all
      format.js {}
    end
  end

  # FIXME - This doesn't belong in this controller
  def auth
    client_id = '4614cd3accaefacf4694'
    client_secret = '5dff49f531f6fecdaec3945ab7c5e94b115211b2'

    github = Github.new(client_id: client_id, client_secret: client_secret)
    address = github.authorize_url
    redirect_to address
  end

  def auth_redirect
    @code = params[:code]

  end

  private
  def project_params
    params.require(:project).permit(:name, :path)
  end

end
