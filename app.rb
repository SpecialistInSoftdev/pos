require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('./lib/**/*.rb')
require('./lib/cart')
require('./lib/customer')
require('./lib/product')
require('./lib/order')



get("/") do
  @customers = Customer.all()
  erb(:index)
end

#################### CUSTOMERS ##########################

post('/customers/new') do
  name = params.fetch('name')
  @customer = Customer.new({:name => name})
  @customer.save()
  redirect("/")
end

get('/customers/:id') do
  @customer = Customer.find(params.fetch("id").to_i())
  @products = Product.all().available()
  @product_ids = Cart.product_ids(@customer.id())
  erb(:customer_info)
end

patch('/customers/:id/edit') do
  @customer = Customer.find(params.fetch("id").to_i())
  name = params.fetch('name')
  @customer.update({:name => name})
  redirect('/customers/' + @customer.id.to_s)
end

delete('/customers/:id/delete') do
  @customer = Customer.find(params.fetch("id").to_i())
  @customer.destroy()
  redirect('/')
end

post('/customers/:id/carts/new') do
  @customer = Customer.find(params.fetch('id').to_i())
  product_id = params.fetch('product_id').to_i()
  price = Product.find(product_id).price()
  cart = Cart.new({:product_id => product_id, :customer_id => params.fetch('id').to_i(), :quantity => 1, :price => price})
  cart.save()
  product = Product.find(product_id)
  new_quantity = product.quantity - 1
  product.update({:quantity => new_quantity})
  redirect('/customers/' + @customer.id().to_s())
end

patch('/customers/:id/carts/:id/edit') do
  @customer = Customer.find(params.fetch('customer_id').to_i())
  cart = Cart.find(params.fetch('cart_id').to_i())
  product = Product.find(cart.product_id)
  new_inventory_quantity = product.quantity - 1
  product.update({:quantity => new_inventory_quantity})
  new_cart_quantity = cart.quantity + 1
  new_price = new_cart_quantity * Product.find(cart.product_id).price
  cart.update({:quantity => new_cart_quantity, :price => new_price})
  redirect('/customers/' + @customer.id().to_s())
end

delete('/customers/:id/carts/:id/delete') do
  @customer = Customer.find(params.fetch("customer_id").to_i())
  @cart = Cart.find(params.fetch('cart_id').to_i())
  product = Product.find(@cart.product_id)
  new_quantity = product.quantity + 1
  product.update({:quantity => new_quantity})
  @cart.destroy()
  redirect('/customers/' + @customer.id().to_s())
end

#################### PRODUCTS ##########################

get('/products') do
  @products = Product.all()
  erb(:products)
end

post('/products/new') do
  name = params.fetch('name')
  quantity = params.fetch('quantity').to_i
  price = params.fetch('price').to_f
  product = Product.new({:description => name, :quantity => quantity, :price => price, :edit => false})
  product.save()
  redirect('/products')
end

patch('/products/:id/edit_false') do
  @product = Product.find(params.fetch("id").to_i())
  name = params.fetch('name')
  quantity = params.fetch('quantity').to_i
  price = params.fetch('price').to_f
  @product.update({:description => name, :quantity => quantity, :price => price, :edit => false})
  redirect('/products')
end

patch('/products/:id/edit_true') do
  @product = Product.find(params.fetch("id").to_i())
  @product.update({:edit => true})
  redirect('/products')
end

delete('/products/:id/delete') do
  @product = Product.find(params.fetch("id").to_i())
  @product.destroy()
  redirect('/products')
end


#################### ORDER HISTORY ##########################

get('/purchase_history') do
  @orders = Order.all()
  erb(:purchase_history)
end

post('/purchase_history/new') do
  total_price = params.fetch('total_price')
  customer_id = params.fetch('customer_id')
  prices = params.fetch('prices')
  products = params.fetch('products')
  quantities = params.fetch('quantities')
  @new_order = Order.new({:customer_id => customer_id, :total => total_price, :products => products, :quantities => quantities, :prices => prices})
  @new_order.save()
  @customer = Customer.find(customer_id)
  @customer.carts.each {|cart| cart.destroy()}
  redirect('/')
end
