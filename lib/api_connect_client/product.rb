module ApiConnectClient
  class Product < Base
    def initialize
      super()
      @headers = { 'X-IBM-APIManagement-Context': ApiConnectClient::Config.context }
    end

    def all
      get("/products")
    end

    def show(product_id)
      @headers['Accept'] = 'application/vnd.ibm-apim.product+json'
      get("/products/#{product_id}")
    end
  end
end