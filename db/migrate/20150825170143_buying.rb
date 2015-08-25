class Buying < ActiveRecord::Migration
  def change
    drop_table(:purchases)

    create_table(:purchases) do |t|
      t.column(:product_id, :integer)
      t.column(:total, :float)
      t.timestamps()
    end
  end
end
