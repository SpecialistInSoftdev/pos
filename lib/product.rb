class Product < ActiveRecord::Base
  scope(:available, -> do
    where("quantity > ?", 0)
  end)
end
