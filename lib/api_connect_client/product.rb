require 'net/http'
require 'json'

class Product

  def initialize
    @headers = { 'X-IBM-APIManagement-Context': 'bci-api-developers-sandbox-desarrollo.local-registry' }
  end

  def list
    uri = URI('https://us.apiconnect.ibmcloud.com/v1/portal/products')

    req = Net::HTTP::Get.new(uri)
    req['X-IBM-APIManagement-Context'] = 'bci-api-developers-sandbox-desarrollo.local-registry'
    req['accept'] = '*/*'

    res = Net::HTTP.start(uri.hostname, uri.port, { use_ssl: true }) {|http|
      http.request(req)
    }
    JSON.parse(res.body)
  end
end
