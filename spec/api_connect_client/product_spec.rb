require 'spec_helper'

RSpec.describe 'product' do
  describe '# list' do
    it do
      product = Product.new
      expect(product.list).to be_an(Array)
    end
  end
end
