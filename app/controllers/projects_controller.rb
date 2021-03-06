class ProjectsController < ApplicationController
  CLIENT_ID = '4614cd3accaefacf4694'
  CLIENT_SECRET = '5dff49f531f6fecdaec3945ab7c5e94b115211b2'

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

  # FIXME - This is not being used right now
  def auth
    github = Github.new(client_id: CLIENT_ID, client_secret: CLIENT_SECRET)
    address = github.authorize_url
    logger.debug "About to redirect to github"
    redirect_to address
  end

  def auth_redirect
    logger.debug "Back from redirect"
    github = Github.new(client_id: CLIENT_ID, client_secret: CLIENT_SECRET)
    @code = params[:code].to_s
    @token = github.get_token(@code).token
    # response =  RestClient.get("https://api.github.com/users/billperegoy/repos?access_token=#{@token}")

    # curl -usigmavirus24 -v -H "Content-Type: application/json" -X POST -d '{"name": "cia", "active": true, "events": ["push"], "config": {"url": "...", "content_type": "json"}}' https://api.github.com/repos/sigmavirus24/reponame/hooks
    response =  RestClient.get("https://api.github.com/repos/billperegoy/test/hooks?access_token=#{@token}")
    # @data = JSON.parse(response)
    #@projects = Project.all
    #format.js {}
  end

  private
  def project_params
    params.require(:project).permit(:name, :path)
  end

end
