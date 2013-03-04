module Auth
  class GithubController < ApplicationController
    def new
      redirect_to Auth::Github.authorize_url
    end

    def create
      token = Auth::Github.access_token(params[:code])
      user_data = Auth::Github.user_data(token)
      member = Member.from_github_data(token.token, user_data)

      login(member)
      redirect_to root_url
    end
  end
end
