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

  describe '#show', vcr: { cassette_name: 'application-show' } do
    it "returns info of an application" do
      result = app.show(ENV['SAMPLE_APP_ID'])
      expect(result["name"]).to eq("Demo")
    end
  end

  describe '#update', vcr: { cassette_name: 'application-update' } do
    it "update application info" do
      body = {
        "name" => "Demo",
        "appImageURL" => "https://something.com/empty.jpg",
        "description" => "pro demo app",
        "oauthRedirectURI" => "https://advanced.demo.cl",
        "public" => true
      }
      result = app.update(ENV['SAMPLE_APP_ID'], body.to_json)
      expect(result["appImageURL"]).to eq("https://something.com/empty.jpg")
      expect(result["oauthRedirectURI"]).to eq("https://advanced.demo.cl")
    end
  end

end
