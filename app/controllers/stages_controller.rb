class StagesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @stage = @project.stages.new
  end

  def create
    @project = Project.find(params[:project_id])
    @stage = @project.stages.new(stage_params)
    if @stage.save
      redirect_to :projects
    else
      render :stage
    end
  end

  private
  def stage_params
    params.require(:stage).permit(:name, :level, :command)
  end
end
