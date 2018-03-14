require 'spec_helper'

RSpec.describe Product do
  let(:product) { described_class.new }

  describe '#all', vcr: { cassette_name: 'products' } do
    it "returns a list all of products" do
      expect(product.all).to be_an(Array)
    end
  end

  describe '#show' do
    it "return a specific product", vcr: { cassette_name: 'product-show' }
    result = product.show("5a0211480cf2b9aa64c1fd5d")
      expect(result["info"]["name"]).to eq("beneficios")
    end
  end
end
