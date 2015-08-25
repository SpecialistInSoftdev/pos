class CartQuantity < ActiveRecord::Migration
  def change
    add_column(:carts, :quantity, :integer)
  end
end
