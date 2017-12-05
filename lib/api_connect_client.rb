require 'dotenv/load'
require_relative './api_connect_client/base'
require_relative './api_connect_client/product'
require_relative './api_connect_client/user'
require_relative './api_connect_client/application'
require_relative './api_connect_client/manager'
require_relative './api_connect_client/developer'
require_relative './api_connect_client/config'

module ApiConnectClient
  VERSION = '0.1.0'
end
