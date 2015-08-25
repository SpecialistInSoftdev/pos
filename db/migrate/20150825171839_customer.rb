class Customer < ActiveRecord::Migration
  def change
    create_table(:customers) do |t|
      t.column(:name, :string)
    end

    create_table(:carts) do |t|
      t.column(:product_id, :integer)
      t.column(:customer_id, :integer)
    end
  end
end
