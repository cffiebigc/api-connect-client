require 'dotenv/load'
require_relative './api_connect_client/base'
require_relative './api_connect_client/product'
require_relative './api_connect_client/user'
require_relative './api_connect_client/application'
require_relative './api_connect_client/admin'
require_relative './api_connect_client/client'

module ApiConnectClient
  VERSION = '0.1.0'
end
