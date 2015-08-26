class InitializeTables < ActiveRecord::Migration
  def change
    create_table(:carts) do |t|
      t.column(:product_id, :integer)
      t.column(:customer_id, :integer)
      t.column(:quantity, :integer)
      t.column(:price, :float)
    end
    create_table(:customers) do |t|
      t.column(:name, :string)
    end
    create_table(:orders) do |t|
      t.column(:customer_id, :integer)
      t.column(:total, :float)
      t.column(:quantities, :string)
      t.column(:products, :string)
      t.column(:prices, :string)
      t.timestamps()
    end
    create_table(:products) do |t|
      t.column(:description, :string)
      t.column(:price, :float)
      t.column(:quantity, :integer)
      t.column(:edit, :boolean)
    end
  end
end
