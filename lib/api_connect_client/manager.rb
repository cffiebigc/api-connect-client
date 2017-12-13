module ApiConnectClient
  class Manager
    def initialize(admin_user = nil , admin_pass = nil)
      @admin_user = "apimanager/#{admin_user || ApiConnectClient::Config.manager_username }"
      @admin_pass = admin_pass || ApiConnectClient::Config.manager_password
    end

    def create_developer(username, password, first_name = '', last_name = '', organization_name = '')
      body = {
        "firstName" => first_name,
        "lastName" => last_name,
        "organization" => organization_name,
        "password" => password,
        "username" => username
      }
      user = ApiConnectClient::User.new(@admin_user, @admin_pass)
      user.create(body.to_json)
    end

    def list_products
      product = ApiConnectClient::Product.new
      product.all
    end

    def show_product(product_id)
      product = ApiConnectClient::Product.new
      product.show(product_id)
    end
  end
end
