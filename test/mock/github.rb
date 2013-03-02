Auth::Github # trigger autolaod

module Auth
  module Github
    MAX_MOLINI_TOKEN = "FAKETOKEN99"
    MAX_MOLINI_DATA = {"login" => "max",
                       "id" => 782943,
                       "email" => "max@gmx.net",
                       "name" => "Max Molini"
                      }

    def authorize_url
      callback_url + "?code=123"
    end

    def access_token(code)
      raise "worong access code" unless code == '123'
      AccessToken.new(MAX_MOLINI_TOKEN)
    end

    class AccessToken < Struct.new(:token)
      def get(path)
        if path == "/user"
          Response.new(MAX_MOLINI_DATA)
        end
      end
    end

    class Response < Struct.new(:parsed)
    end
  end
end

def create_member!
  Member.from_github_data(Auth::Github::MAX_MOLINI_TOKEN, Auth::Github::MAX_MOLINI_DATA)
end
