class Order < ActiveRecord::Migration
  def change
    drop_table(:purchases)

    create_table(:orders) do |t|
      t.column(:customer_id, :integer)
      t.column(:total, :float)
    end
  end
end
