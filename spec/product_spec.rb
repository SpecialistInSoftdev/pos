require('spec_helper')

describe(Product) do
  describe('#available') do
    it('returns true if product quantity is greater than 0') do
      test_product = Product.new({:description => "Water bottles", :price => 1.00, :quantity => 2})
      test_product.save()
      expect(Product.available()).to(eq([test_product]))
    end
  end

end
