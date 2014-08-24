class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice:
        "Project #{@project.name} successfully created!"
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to projects_path, notice:
        "Project #{@project.name} successfully updated!"
    else
      render :edit
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :path)
  end

end
