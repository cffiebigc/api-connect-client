class User < Base
  def initialize
    @headers = {
      'X-IBM-APIManagement-Context': ENV['BLUEMIX_CONTEXT']
    }
  end

  def create(body)
    post('/users/register', body)
  end
end
