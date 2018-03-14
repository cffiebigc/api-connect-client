require 'spec_helper'

RSpec.describe ApiConnectClient::User do
	let(:user) { ApiConnectClient::User.new('mymail@domain.com', 'LYVejCmW7abFzA==') }

  before(:all) do
    ApiConnectClient::Config.register_context (ENV['BLUEMIX_CONTEXT'] || 'BLUEMIX_CONTEXT')
  end

  describe '#get_info', vcr: { cassette_name: 'user-profile' } do
    it "returns the info of the connected user" do
      result = user.get_info
      expect(result['name']).to eq('mymail@domain.com')
    end
  end
end
