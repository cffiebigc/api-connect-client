module ApiConnectClient
  class Application < Base
    def initialize(org_id, user, pass)
      super
      @headers = { 'X-IBM-APIManagement-Context': Config.context }
      @owner = { id: org_id, username: user, password: pass }
    end

    def all
      get("/orgs/#{@owner[:id]}/apps", @owner[:username], @owner[:password])
    end

    def create(body)
      post("/orgs/#{@owner[:id]}/apps", body, @owner[:username], @owner[:password])
    end

    def show(app_id)
      get("/orgs/#{@owner[:id]}/apps/#{app_id}", @owner[:username], @owner[:password])
    end

    def update(app_id, body)
      put("/orgs/#{@owner[:id]}/apps/#{app_id}", body, @owner[:username], @owner[:password])
    end

    def update_credentials(app_id, body)
      put("/orgs/#{@owner[:id]}/apps/#{app_id}/credentials", body, @owner[:username], @owner[:password])
    end

    def subscribe(app_id, body)
      post("/orgs/#{@owner[:id]}/apps/#{app_id}/subscriptions", body, @owner[:username], @owner[:password])
    end
  end
end