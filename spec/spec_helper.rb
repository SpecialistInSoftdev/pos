require('rspec')
require('pg')
require('sinatra/activerecord')
require('product')
require('order')
require('customer')
require('cart')

RSpec.configure do |config|
  config.after(:each) do
    Product.all().each() do |product|
      product.destroy()
    end

    Order.all().each() do |purchase|
      purchase.destroy()
    end

    Customer.all().each() do |customer|
      customer.destroy()
    end

    Cart.all().each() do |cart|
      cart.destroy()
    end
  end
end
