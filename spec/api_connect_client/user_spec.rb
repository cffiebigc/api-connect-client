require 'spec_helper'

RSpec.describe User do
	let(:user) { described_class.new }

  describe '#create', vcr: { cassette_name: 'user-new' } do
    it "returns the info of the newly created user" do
      body = {
        "firstName" => "Test",
        "lastName" => "Ter",
        "organization" => "tester",
        "password" => "Asd123%",
        "username" => "tester@test.com"
      }
      result = user.create(body.to_json)
      expect(result['firstName']).to eq('Test')
      expect(result['email']).to eq('tester@test.com')
    end
  end
end
