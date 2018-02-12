require 'faraday'
require 'json'

require "subox_api/version"
require "subox_api/auth"
require "subox_api/boxes"
require "subox_api/client"

module SuboxApi
  Response = Struct.new(:data, :response)
end
