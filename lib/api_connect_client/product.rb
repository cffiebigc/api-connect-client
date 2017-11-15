class Product < Base
  def initialize
    @headers = { 'X-IBM-APIManagement-Context': ENV['BLUEMIX_CONTEXT'] }
  end

  def all
    get("/products")
  end

  def show(product_id)
  	@headers['Accept'] = 'application/vnd.ibm-apim.product+json'
    get("/products/#{product_id}")
  end
end
