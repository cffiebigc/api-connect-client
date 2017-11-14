require 'net/http'
require 'json'

class Base
	ENDPOINT = 'https://us.apiconnect.ibmcloud.com/v1/portal'

	attr_accessor :headers

	def initialize(_headers)
		@headers = _headers
	end

	private

	def get(path, params = {})
		uri = URI("#{ENDPOINT}#{path}?#{URI.encode_www_form(params)}")
    req = Net::HTTP::Get.new(uri)
    set_headers_for(req)
    res = Net::HTTP.start(uri.hostname, uri.port, { use_ssl: true }) { |http| http.request(req) }
    JSON.parse(res.body)
	end

	def post
		# TODO
	end

	def set_headers_for(request)
		@headers.to_a.each do |header|
			request[ header[0] ] = header[1]
		end
	end
end