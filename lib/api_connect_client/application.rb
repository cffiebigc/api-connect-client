class Application < Base
  def initialize
    @headers = { 'X-IBM-APIManagement-Context': ENV['BLUEMIX_CONTEXT'] }
  end

  def all(org_id, user, pass)
    get("/orgs/#{org_id}/apps", user, pass)
  end
end
