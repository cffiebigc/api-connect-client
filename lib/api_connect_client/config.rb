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
    end
  end
end
