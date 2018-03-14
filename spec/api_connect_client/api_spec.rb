require 'spec_helper'

RSpec.describe ApiConnectClient::Api do
	let(:api)  { described_class.new }

	before(:all) do
		ApiConnectClient::Config.register_context (ENV['BLUEMIX_CONTEXT'] || 'BLUEMIX_CONTEXT')
	end

  describe '#list_public_apis', vcr: { cassette_name: 'api-list' } do
    it "lists the public apis associated to the context" do
			result = api.list_public_apis
			expect(result).to be_an(Array)
    end
  end

	describe '#get_swagger_from_public_api', vcr: { cassette_name: 'api-get-swagger' } do
		it "gets a json swagger from an app, through it's id" do
			result = api.get_swagger_from_public_api "5a956c490cf23b2cf8eacfbe"
			expect(result["swagger"]).to eq("2.0")
		end
	end

end
