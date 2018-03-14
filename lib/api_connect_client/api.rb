module ApiConnectClient
  class Api < Base
    def initialize
      super()
      @headers = {
        'X-IBM-APIManagement-Context': ApiConnectClient::Config.context
      }
    end

    def list_public_apis
      get('/apis')
    end

    def get_swagger_from_public_api(apiID)
      get("/apis/#{apiID}")
    end

  end
end
