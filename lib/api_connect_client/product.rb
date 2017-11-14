class Product < Base
  def initialize
    @headers = { 'X-IBM-APIManagement-Context': 'bci-api-developers-sandbox-desarrollo.local-registry' }
  end

  def list
    get("/products")
  end

  def show(product_id)
    get("/products/#{product_id}")
  end
end
