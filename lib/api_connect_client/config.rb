module ApiConnectClient
  class Config
    class << self

      def register_context(context)
        @context = context
      end

      def context
        @context ||= ''
      end

      def register_endpoint(endpoint)
        @endpoint = endpoint
      end

      def endpoint
        @endpoint ||= 'https://us.apiconnect.ibmcloud.com/v1/portal'
      end

      def register_manager_credentials(username, password)
        @manager_username = username
        @manager_password = password
      end

      def manager_username
        @manager_username ||= ''
      end

      def manager_password
        @manager_password ||= ''
      end
    end
  end
end
