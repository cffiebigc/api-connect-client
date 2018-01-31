module ApiConnectClient
  class Developer
    def initialize(username, password, organization_id)
      @headers = {
        'X-IBM-APIManagement-Context': ApiConnectClient::Config.context
      }
      @username = username
      @password = password
      @@organization_id = organization_id
    end

    def create_application(name, description, oauth_redirect_url, public_app = false)
      body = {
        "name" => name,
        "credentials" => {
          "clientID" => true,
          "clientSecret" => true
        },
        "description" => description || '',
        "oauthRedirectURI" => oauth_redirect_url,
        "public" => public_app
      }
      app = ApiConnectClient::Application.new(@@organization_id, @username, @password)
      app.create(body.to_json)
    end

    def list_applications
      app = ApiConnectClient::Application.new(@@organization_id, @username, @password)
      app.all
    end

    def delete_application(app_id)
      app = ApiConnectClient::Application.new(@@organization_id, @username, @password)
      app.remove(app_id)
    end

    def show_application(app_id)
      app = ApiConnectClient::Application.new(@@organization_id, @username, @password)
      app.show(app_id)
    end

    def update_application(app_id, name, description, oauth_redirect_uri, public_app)
      body = {
        "name" => name,
        "appImageURL" => "https://something.com/empty.jpg",
        "description" => description,
        "oauthRedirectURI" => oauth_redirect_uri,
        "public" => public_app
      }
      app = ApiConnectClient::Application.new(@@organization_id, @username, @password)
      app.update(app_id, body.to_json)
    end

    def update_application_credentials(app_id, client_id, client_secret)
      body = {
        "clientID" => client_id,
        "clientSecret" => client_secret
      }
      app = ApiConnectClient::Application.new(@@organization_id, @username, @password)
      app.update_credentials(app_id, body.to_json)
    end

    def subscribe_application(app_id, product_id, plan = 'default')
      body = {
        "plan" => plan,
        "product" => {
          "id" => product_id
        }
      }
      app = ApiConnectClient::Application.new(@@organization_id, @username, @password)
      app.subscribe(app_id, body.to_json)
    end

    def list_application_subscriptions(app_id)
      app = ApiConnectClient::Application.new(@@organization_id, @username, @password)
      app.list_subscriptions(app_id)
    end

    def unsubscribe_application(app_id, subscription_id)
      app = ApiConnectClient::Application.new(@@organization_id, @username, @password)
      app.unsubscribe(app_id, subscription_id)
    end
  end
end
