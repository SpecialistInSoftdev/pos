class Items < ActiveRecord::Migration
  def change
    add_column(:products, :edit, :boolean)
  end
end
