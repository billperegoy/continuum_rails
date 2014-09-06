class GithubController < ApplicationController
  CLIENT_ID = '4614cd3accaefacf4694'
  CLIENT_SECRET = '5dff49f531f6fecdaec3945ab7c5e94b115211b2'

  def auth
    github = Github.new(client_id: CLIENT_ID, client_secret: CLIENT_SECRET)
    address = github.authorize_url
    redirect_to address
  end

  def auth_redirect
    github = Github.new(client_id: CLIENT_ID, client_secret: CLIENT_SECRET)
    @code = params[:code].to_s
    @token = github.get_token(@code)
  end
end
