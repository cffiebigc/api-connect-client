module ApiConnectClient
  class User < Base
    def initialize(admin_user, admin_pass)
      super
      @headers = {
        'X-IBM-APIManagement-Context': Config.context
      }
      @admin_user = admin_user
      @admin_pass = admin_pass
    end

    def create(body)
      post('/users/register', body, @admin_user, @admin_pass)
    end
  end
end