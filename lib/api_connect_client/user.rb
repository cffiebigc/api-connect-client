module ApiConnectClient
  class User < Base
    def initialize(username, password)
      super()
      @headers = {
        'X-IBM-APIManagement-Context': ApiConnectClient::Config.context
      }
      @username = username
      @password = password
    end

    def get_info
      get("/me", @username, @password)
    end

    def list_organizations
      get("/orgs", @username, @password)
    end

  end
end
