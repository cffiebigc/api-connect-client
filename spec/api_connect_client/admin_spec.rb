require 'spec_helper'

RSpec.describe ApiConnectClient::Admin do
	let(:admin) { ApiConnectClient::Admin.new(ENV['ADMIN_USERNAME'] || 'ADMIN_USERNAME', ENV['ADMIN_PASSWORD'] || 'ADMIN_PASSWORD') }

  describe '#register_developer', vcr: { cassette_name: 'admin-new' } do
    it "returns the info of the newly created user" do
      body = {
        "firstName" => "Test",
        "lastName" => "Ter",
        "organization" => "tester",
        "password" => "Asd123%",
        "username" => "tester@test.com"
      }
      result = admin.register_developer(body.to_json)
      expect(result['firstName']).to eq('Test')
      expect(result['email']).to eq('tester@test.com')
    end
  end
end
