class Application < Base
  def initialize(org_id, user, pass)
    @headers = { 'X-IBM-APIManagement-Context': ENV['BLUEMIX_CONTEXT'] }
    @owner = { id: org_id, username: user, password: pass }
  end

  def all
    get("/orgs/#{@owner[:id]}/apps", @owner[:username], @owner[:password])
  end

  def create(body)
    post("/orgs/#{@owner[:id]}/apps", body, @owner[:username], @owner[:password])
  end
end
