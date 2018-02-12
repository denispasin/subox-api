module SuboxApi
  class Client
    def initialize(username:, password:, url: "https://api.subox.co")
      @connection = Faraday.new(url: url) do |faraday|
        faraday.use(SuboxApi::Auth, username: username, password: password, url: url)
        faraday.adapter Faraday.default_adapter
      end
    end

    def boxes
      SuboxApi::Boxes.new(@connection)
    end
  end
end
