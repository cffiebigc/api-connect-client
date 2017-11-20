require 'spec_helper'

RSpec.describe Application do
	let(:app) { described_class.new }

  describe '#all', vcr: { cassette_name: 'applications' } do
    it "returns all applications of the given organization" do
      expect(app.all(ENV['SAMPLE_APP_ID'],ENV['SAMPLE_USERNAME'],ENV['SAMPLE_PASSWORD'])).to be_an(Array)
    end
  end
end
