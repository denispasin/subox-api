module SuboxApi
  class Boxes
    def initialize(connection)
      @connection = connection
    end

    def all
      response = @connection.get('/v1/boxes')
      result =
        if response.success?
          JSON.parse(response.body)
        end
      Response.new(result, response)
    end
  end
end
