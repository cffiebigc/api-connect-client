module ApiConnectClient
  class Admin < Base
    def initialize(admin_user, admin_pass)
      super()
      @headers = {
        'X-IBM-APIManagement-Context': ApiConnectClient::Config.context
      }
      @admin_user = admin_user
      @admin_pass = admin_pass
    end

    def register_developer(body)
      post('/users/register', body, @admin_user, @admin_pass)
    end

  end
end
