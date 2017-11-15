require 'net/http'
require 'json'

class Base
  ENDPOINT = ENV['ENPOINT_URL']

  attr_accessor :headers

  def initialize(_headers)
    @headers = _headers
  end

  private

  def get(path, params = {})
    uri = URI("#{ENDPOINT}#{path}?#{URI.encode_www_form(params)}")
    req = Net::HTTP::Get.new(uri)
    headers_for(req)
    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
    JSON.parse(res.body)
  end

  def post(path, body, params = {})
    uri = URI("#{ENDPOINT}#{path}?#{URI.encode_www_form(params)}")
    req = Net::HTTP::Post.new(uri)
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
