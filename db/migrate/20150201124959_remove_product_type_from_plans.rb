class RemoveProductTypeFromPlans < ActiveRecord::Migration
  def change
    remove_column :plans, :product_type, :string
  end
end
