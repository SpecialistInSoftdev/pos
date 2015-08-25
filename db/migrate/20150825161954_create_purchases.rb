class CreatePurchases < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|
      t.column(:product_ids, :string)
      t.column(:prices, :string)
      t.column(:total, :float)
      t.timestamps()
    end
  end
end
