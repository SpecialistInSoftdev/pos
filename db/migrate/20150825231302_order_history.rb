class OrderHistory < ActiveRecord::Migration
  def change
    add_column(:orders, :quantities, :string)
    add_column(:orders, :products, :string)
    add_column(:orders, :prices, :string)

  end
end
