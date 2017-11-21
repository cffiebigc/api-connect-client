require 'spec_helper'

RSpec.describe Application do
	let(:app) { Application.new(ENV['SAMPLE_ORG_ID'], ENV['SAMPLE_USERNAME'], ENV['SAMPLE_PASSWORD']) }

  describe '#all', vcr: { cassette_name: 'applications' } do
    it "returns all applications of the given organization" do
      expect(app.all).to be_an(Array)
    end
  end

  describe '#create', vcr: { cassette_name: 'application-create' } do
    it "returns info of the new application" do
      body = {
        "name" => "Demo",
        "credentials" => {
          "clientID" => true,
          "clientSecret" => true
        },
        "description" => "demo app",
        "oauthRedirectURI" => "https://demo.cl",
        "public" => false
      }
      result = app.create(body.to_json)
      expect(result['name']).to eq('Demo')
    end
  end
end
