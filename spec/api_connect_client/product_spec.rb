require 'spec_helper'

RSpec.describe 'product' do
  describe '#list', vcr: { cassette_name: 'products' } do
    it "returns a list of products" do
      product = Product.new
      expect(product.list).to be_an(Array)
    end
  end

  describe '#show', vcr: { cassette_name: 'products' } do 
  	
  end
end
