require 'net/http'
require 'json'

module ApiConnectClient
  class Base

    def initialize
      @endpoint = ApiConnectClient::Config.endpoint
    end

    private

    def get(path, user = nil, pass = nil, params = {})
      uri = URI("#{@endpoint}#{path}?#{URI.encode_www_form(params)}")
      req = Net::HTTP::Get.new(uri)
      req.basic_auth(user, pass) unless user.nil? || pass.nil?
      headers_for(req)
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
      JSON.parse(res.body)
    end

    def post(path, body, user = nil, pass = nil, params = {})
      uri = URI("#{@endpoint}#{path}?#{URI.encode_www_form(params)}")
      req = Net::HTTP::Post.new(uri)
      req.basic_auth(user, pass) unless user.nil? || pass.nil?
      headers_for(req)
      req.content_type = 'application/json'
      req.body = body
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
      JSON.parse(res.body)
    end

    def put(path, body, user = nil, pass = nil, params = {})
      uri = URI("#{@endpoint}#{path}?#{URI.encode_www_form(params)}")
      req = Net::HTTP::Put.new(uri)
      req.basic_auth(user, pass) unless user.nil? || pass.nil?
      headers_for(req)
      req.content_type = 'application/json'
      req.body = body
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
      JSON.parse(res.body)
    end

    def headers_for(request)
      @headers.to_a.each do |header|
        request[header[0]] = header[1]
      end
    end
  end
end