module Auth
  module Github
    extend self

    def authorize_url
      client.auth_code.authorize_url(:redirect_uri => callback_url,
                                     :scope => github_scopes)
    end

    def access_token(code)
      token = client.auth_code.get_token(code)
    end

    def user_data(token)
      token.get("/user").parsed
    end

    def client
      OAuth2::Client.new('1420b9f1c974a8c0cf1f',
                         ENV['GITHUB_SECRET'],
                         {
                          site: 'https://api.github.com',
                          authorize_url: 'https://github.com/login/oauth/authorize',
                          token_url: 'https://github.com/login/oauth/access_token'
                         })
    end

    private
    def github_scopes
      'user:email'
    end

    def callback_url
      'http://ruvetia.org/auth/github/create'
    end
  end
end
