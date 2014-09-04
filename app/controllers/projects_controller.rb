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

  private
  def project_params
    params.require(:project).permit(:name, :path)
  end

end
