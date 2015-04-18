class AddProductTypeToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :product_type, :string
  end
end
