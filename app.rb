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

post('/customers/new') do
  name = params.fetch('name')
  @customer = Customer.new({:name => name})
  @customer.save()
  redirect("/")
end

get('/customers/:id') do
  @customer = Customer.find(params.fetch("id").to_i())
  @carts = @customer.carts()
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
