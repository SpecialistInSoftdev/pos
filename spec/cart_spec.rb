require('spec_helper')

describe(Cart) do
  describe('.product_ids') do
    it('returns an array of a customers products') do
      test_customer = Customer.new({:name => 'Steve'})
      test_customer.save()
      test_product = Product.new({:description => 'tea', :quantity => 5, :price => 3.5, :edit => false})
      test_product.save()
      test_product2 = Product.new({:description => 'coffee', :quantity => 5, :price => 3.5, :edit => false})
      test_product2.save()
      test_cart = test_customer.carts.new({:product_id => test_product.id()})
      test_cart2 = test_customer.carts.new({:product_id => test_product2.id()})
      test_customer.save()
      expect(Cart.product_ids(test_customer.id())).to(eq([test_product.id(), test_product2.id()]))
    end
  end
end
