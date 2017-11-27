class User < Base
  def initialize(admin_user, admin_pass)
    @headers = {
      'X-IBM-APIManagement-Context': ENV['BLUEMIX_CONTEXT']
    }
    @admin_user = admin_user
    @admin_pass = admin_pass
  end

  def create(body)
    post('/users/register', body, @admin_user, @admin_pass)
  end
end
