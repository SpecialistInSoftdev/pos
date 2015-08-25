class Customer < ActiveRecord::Base
  has_many(:carts)
end
