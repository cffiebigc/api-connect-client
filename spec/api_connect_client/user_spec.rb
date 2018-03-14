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

  describe '#list_organizations', vcr: { cassette_name: 'user-organization-list' } do
    it "returns the organization list" do
      result = user.list_organizations
      expect(result[0]['name']).to eq('mymail@domain.com')
    end
  end

end
