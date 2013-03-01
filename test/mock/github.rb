Auth::Github # trigger autolaod

module Auth
  module Github

    def authorize_url
      callback_url + "?code=123"
    end

    def access_token(code)
      raise "worong access code" unless code == '123'
      AccessToken.new('FAKETOKEN99')
    end

    class AccessToken < Struct.new(:token)
      def get(path)
        if path == "/user"
          Response.new({"login" => "max",
                        "id" => 782943,
                        "email" => "max@gmx.net",
                        "name" => "Max Molini"
                       })
        end
      end
    end

    class Response < Struct.new(:parsed)
    end

  end
end
