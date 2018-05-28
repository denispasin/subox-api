module SuboxApi
  class Auth < Faraday::Middleware
    def initialize(app = nil, options = {})
      raise "missing username" unless options[:username]
      raise "missing password" unless options[:password]
      raise "missing url" unless options[:url]
      super(app)
      @username = options[:username]
      @password = options[:password]
      @url = options[:url]
    end

    def call(request_env)
      request_env[:request_headers].merge!(token)

      @app.call(request_env) do |response_env|
        parse_auth_token(response_env[:response_headers])
      end
    end

    private

    def parse_auth_token(response_headers)
      return unless response_headers["access-token"]
      @token = {
        "access-token" => response_headers["access-token"],
        "client" => response_headers["client"],
        "expiry" => response_headers["expiry"],
        "token-type" => "bearer",
        "uid" => response_headers["uid"]
      }
    end

    def token
      @token || (sign_in && @token)
    end

    def sign_in
      sign_in_response = Faraday.post("#{@url}/auth/sign_in", login: @username, password: @password)
      parse_auth_token(sign_in_response.headers)
    end
  end
end
