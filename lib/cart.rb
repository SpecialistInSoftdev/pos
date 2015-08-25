require 'pry'

class Cart < ActiveRecord::Base
  belongs_to(:customer)

  define_method(:check_for_product) do |id|
    self.product_id == id
  end

  define_singleton_method(:product_ids) do |customer_id|
    product_id_array = []
    customer = Customer.find(customer_id)
    customer.carts.each do |item|
      product_id_array.push(item.product_id)
    end
    product_id_array
  end
end
